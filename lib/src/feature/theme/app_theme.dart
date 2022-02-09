import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/utils/colors.dart';

const _primaryColor = Color(0xFF5bc39d);
const _secondaryColor = Color(0xFF306ef6);
const _successColor = Color(0xFF306ef6);
const _infoColor = Color(0xFF306ef6);
const _warningColor = Color(0xFF306ef6);
const _dangerColor = Color(0xFFBA2121);

const _textColorDark = Color(0xFF121212);
const _textColorLight = Color(0xFFf6f6f6);

enum AppColorVariant {
  Primary,
  Secondary,
  // Info,
  // Success,
  // Warning,
  Danger,
}

extension CustomColorScheme on ColorScheme {
  Color get primary => _primaryColor;
  Color get secondary => _secondaryColor;
  Color get success => _successColor;
  Color get info => _infoColor;
  Color get warning => _warningColor;
  Color get danger => _dangerColor;

  Color get text =>
      brightness == Brightness.light ? _textColorDark : _textColorLight;

  Color get playerBackground => brightness == Brightness.light
      ? const Color.fromRGBO(230, 230, 230, 1)
      : const Color.fromRGBO(20, 20, 20, 1);

  Color get playerForeground => brightness == Brightness.light
      ? const Color.fromRGBO(20, 20, 20, 1)
      : const Color.fromRGBO(200, 200, 200, 1);

  // buttons
  Color get primaryButtonBg => primary;
  Color get primaryButtonFg => const Color(0xFFFFFFFF);

  Color get secondaryButtonBg => secondary;
  Color get secondaryButtonFg => const Color(0xFFFFFFFF);

  Color get dangerButtonBg => danger;
  Color get dangerButtonFg => const Color(0xFFFFFFFF);
}

class AppTheme {
  final ThemeData themeData;

  const AppTheme({
    required this.themeData,
  });

  factory AppTheme.light() {
    final _themeData = ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: createMaterialColor(_primaryColor),
        accentColor: _secondaryColor,
      ),
      textTheme: _textTheme(),
    );

    return AppTheme(themeData: _themeData);
  }

  factory AppTheme.dark() {
    final _themeData = ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        primarySwatch: createMaterialColor(_primaryColor),
        accentColor: _secondaryColor,
      ),
      textTheme: _textTheme(true),
    );

    return AppTheme(themeData: _themeData);
  }

  static TextTheme _textTheme([bool isDark = false]) {
    return TextTheme(
      headline1: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w700,
        color: isDark ? _textColorLight : _textColorDark,
      ),
      headline2: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: isDark ? _textColorLight : _textColorDark,
      ),
      headline3: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: isDark ? _textColorLight : _textColorDark,
      ),
      headline4: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: (isDark ? _textColorLight : _textColorDark).withOpacity(0.8),
      ),
      headline5: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: (isDark ? _textColorLight : _textColorDark).withOpacity(0.7),
      ),
      headline6: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: (isDark ? _textColorLight : _textColorDark).withOpacity(0.6),
      ),
    );
  }

  static appVariantToColor(BuildContext context, AppColorVariant variant) {
    final _colors = Theme.of(context).colorScheme;
    switch (variant) {
      case AppColorVariant.Primary:
        return _colors.primary;
      case AppColorVariant.Secondary:
        return _colors.secondary;
      // case AppColorVariant.Info:
      //   return _colors.info;
      // case AppColorVariant.Success:
      //   return _colors.success;
      // case AppColorVariant.Warning:
      //   return _colors.warning;
      case AppColorVariant.Danger:
        return _colors.danger;
    }
  }
}
