import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BreakPoints {
  static const double breakpointMobile = 580;
  static const double breakpointTablet = 800;
  static const double breakpointDesktop = 1200;
  static const double breakpoint4K = 2000;

  static bool useMobileLayout(BuildContext context) {
    return MediaQuery.of(context).size.width <= breakpointMobile;
  }

  static const List<ResponsiveBreakpoint> breakpoints = [
    ResponsiveBreakpoint.resize(breakpointMobile, name: MOBILE),
    ResponsiveBreakpoint.autoScale(breakpointTablet, name: TABLET),
    ResponsiveBreakpoint.resize(breakpointDesktop, name: DESKTOP),
    ResponsiveBreakpoint.autoScale(breakpoint4K, name: '4K'),
  ];
}
