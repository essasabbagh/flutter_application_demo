import 'package:flutter/material.dart';

extension ContextExtensionss on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  EdgeInsets get mediaQueryPadding => mediaQuery.padding;
  EdgeInsets get mediaQueryViewPadding => mediaQuery.viewPadding;
  EdgeInsets get mediaQueryViewInsets => mediaQuery.viewInsets;

  Orientation get orientation => mediaQuery.orientation;
  double get devicePixelRatio => mediaQuery.devicePixelRatio;
  bool get isLandscape => orientation == Orientation.landscape;
  bool get isPortrait => orientation == Orientation.portrait;

  bool get isPhone => (mediaQueryShortestSide < 600);
  bool get isSmallTablet => (mediaQueryShortestSide >= 600);
  bool get isLargeTablet => (mediaQueryShortestSide >= 720);
  bool get isTablet => isSmallTablet || isLargeTablet;

  Size get mediaQuerySize => mediaQuery.size;
  double get height => mediaQuerySize.height;
  double get width => mediaQuerySize.width;
  double get mediaQueryShortestSide => mediaQuerySize.shortestSide;

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  bool get isDark => theme.brightness == Brightness.dark;

  bool get isDarkMode =>
      MediaQuery.platformBrightnessOf(this) == Brightness.dark;
  bool get isLightMode =>
      MediaQuery.platformBrightnessOf(this) == Brightness.dark;

  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);
  FocusScopeNode get focusScope => FocusScope.of(this);
  ScaffoldState get scaffold => Scaffold.of(this);
  AssetBundle get assetBundle => DefaultAssetBundle.of(this);
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  void unFocusKeyBoard() {
    if (!focusScope.hasPrimaryFocus) focusScope.unfocus();
  }

  void openDrawer() => scaffold.openDrawer();

  Future showBottomSheet(
    Widget child, {
    bool isScrollControlled = true,
    Color? backgroundColor,
    Color? barrierColor,
  }) {
    return showModalBottomSheet(
      context: this,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      builder: (context) => child,
    );
  }
}
