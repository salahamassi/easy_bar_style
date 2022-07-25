import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:nested/nested.dart';

import 'helpers.dart';

class SystemNavigationBarStyle extends SingleChildStatefulWidget {
  final Color? color;
  final Color? dividerColor;
  final Brightness? iconBrightness;
  final bool maintainState;

  const SystemNavigationBarStyle({
    Key? key,
    this.color,
    this.dividerColor,
    this.iconBrightness,
    this.maintainState = true,
    Widget? child,
  }) : super(key: key, child: child);

  @override
  State<SystemNavigationBarStyle> createState() =>
      _EasySystemNavigationBarState();
}

class _EasySystemNavigationBarState
    extends SingleChildState<SystemNavigationBarStyle> with RouteAware {
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
    final systemNavigationBarIconBrightness = widget.iconBrightness ??
        EasyStatusBarBrightness.estimateBrightnessForColor(widget.color);
    final SystemUiOverlayStyle systemUiOverlayStyle;
    if (latestSystemUiOverlayStyle != null) {
      systemUiOverlayStyle = latestSystemUiOverlayStyle!.copyWith(
        systemNavigationBarColor: widget.color,
        systemNavigationBarDividerColor: widget.dividerColor,
        systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
      );
    } else {
      systemUiOverlayStyle = SystemUiOverlayStyle(
        systemNavigationBarColor: widget.color,
        systemNavigationBarDividerColor: widget.dividerColor,
        systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
      );
    }
    latestSystemUiOverlayStyle = systemUiOverlayStyle;
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
