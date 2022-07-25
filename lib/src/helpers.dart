import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

RouteObserver<PageRoute> styleRouteObserver = RouteObserver<PageRoute>();
SystemUiOverlayStyle? latestSystemUiOverlayStyle;

extension EasyStatusBarBrightness on Brightness {
  Brightness get invert =>
      this == Brightness.light ? Brightness.dark : Brightness.light;

  static Brightness estimateBrightnessForColor(Color? color) {
    if (color == null) {
      return Brightness.light;
    }
    final double relativeLuminance = color.computeLuminance();

    // See <https://www.w3.org/TR/WCAG20/#contrast-ratiodef>
    // The spec says to use kThreshold=0.0525, but Material Design appears to bias
    // more towards using light text than WCAG20 recommends. Material Design spec
    // doesn't say what value to use, but 0.15 seemed close to what the Material
    // Design spec shows for its color palette on
    // <https://material.io/go/design-theming#color-color-palette>.
    const double kThreshold = 0.15;
    if ((relativeLuminance + 0.05) * (relativeLuminance + 0.05) > kThreshold) {
      return Brightness.light;
    }
    return Brightness.dark;
  }
}
