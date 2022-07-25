import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';

import 'helpers.dart';

class StatusBarStyle extends SingleChildStatefulWidget {
  final Brightness? brightness;
  final Color? color;
  final bool maintainState;

  const StatusBarStyle({
    Key? key,
    this.brightness,
    required this.color,
    this.maintainState = true,
    Widget? child,
  }) : super(key: key, child: child);

  @override
  State<StatusBarStyle> createState() => _EasyStatusBarState();
}

class _EasyStatusBarState extends SingleChildState<StatusBarStyle>
    with RouteAware {
  @override
  void didChangeDependencies() {
    PageRoute route = ModalRoute.of(context) as PageRoute;
    styleRouteObserver.subscribe(this, route);
    super.didChangeDependencies();
  }

  @override
  void didPush() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _setSystemUIOverlayStyle();
      },
    );
  }

  @override
  void didPopNext() {
    if (widget.maintainState) {
      Future.delayed(
        const Duration(milliseconds: 100),
        _setSystemUIOverlayStyle,
      );
    }
  }

  @override
  void dispose() {
    styleRouteObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) => child!;

  void _setSystemUIOverlayStyle() {
    final statusBarBrightness = widget.brightness ??
        EasyStatusBarBrightness.estimateBrightnessForColor(widget.color);
    final SystemUiOverlayStyle systemUiOverlayStyle;
    if (latestSystemUiOverlayStyle != null) {
      systemUiOverlayStyle = latestSystemUiOverlayStyle!.copyWith(
        statusBarColor: widget.color,
        statusBarBrightness: statusBarBrightness,
        statusBarIconBrightness: statusBarBrightness.invert,
      );
    } else {
      systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: widget.color,
        statusBarBrightness: statusBarBrightness,
        statusBarIconBrightness: statusBarBrightness.invert,
      );
    }
    latestSystemUiOverlayStyle = systemUiOverlayStyle;
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
