import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ColorScheme myFlexSchemeLight = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff13a8b0),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xff97baea),
  onPrimaryContainer: Color(0xff1a2027),
  secondary: Color(0xff5edae2),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffd9e3f8),
  onSecondaryContainer: Color(0xff121c2b),
  tertiary: Color(0xff007881),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xffbeeaf7),
  onTertiaryContainer: Color(0xff001f26),
  error: Color(0xffba1a1a),
  onError: Color(0xffffffff),
  errorContainer: Color(0xffffdad6),
  onErrorContainer: Color(0xff410002),
  background: Color(0xfffcfaff),
  onBackground: Color(0xff1a1b1e),
  surface: Color(0xfffcfaff),
  onSurface: Color(0xff1a1b1e),
  surfaceVariant: Color(0xffe1e3ed),
  onSurfaceVariant: Color(0xff43474e),
  outline: Color(0xff74777f),
  shadow: Color(0xff000000),
  inverseSurface: Color(0xff3e3f43),
  onInverseSurface: Color(0xfff1f0f4),
  inversePrimary: Color(0xffa8c8ff),
  surfaceTint: Color(0xfff9f9ff),
);

ColorScheme myFlexSchemeDark = const ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff5edae2),
  onPrimary: Color(0xff003062),
  primaryContainer: Color(0xff00468a),
  onPrimaryContainer: Color(0xffd6e3ff),
  secondary: Color(0xff13a8b0),
  onSecondary: Color(0xff273141),
  secondaryContainer: Color(0xff3e4758),
  onSecondaryContainer: Color(0xffd9e3f8),
  tertiary: Color(0xffa3cddb),
  onTertiary: Color(0xff033640),
  tertiaryContainer: Color(0xff214c58),
  onTertiaryContainer: Color(0xffbeeaf7),
  error: Color(0xffffb4ab),
  onError: Color(0xff690005),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xffffb4ab),
  background: Color(0xff22252b),
  onBackground: Color(0xffe3e2e6),
  surface: Color(0xff1d1f24),
  onSurface: Color(0xffe3e2e6),
  surfaceVariant: Color(0xff454a52),
  onSurfaceVariant: Color(0xffc4c6cf),
  outline: Color(0xff8e9099),
  shadow: Color(0xff000000),
  inverseSurface: Color(0xffe1e1e6),
  onInverseSurface: Color(0xff2f3033),
  inversePrimary: Color(0xff265ea7),
  surfaceTint: Color(0xffa8c8ff),
);

// var MyFlexThemeDataLight = FlexThemeData.light(colorScheme: myFlexSchemeLight);

ThemeData MyFlexThemeDataLight = FlexThemeData.light(
  colorScheme: myFlexSchemeLight,

  appBarStyle: FlexAppBarStyle.scaffoldBackground,
  blendLevel: 20,
  appBarOpacity: 0.95,
  tabBarStyle: FlexTabBarStyle.forBackground,
  lightIsWhite: true,
  swapColors: true,
  tooltipsMatchBackground: true,
  subThemesData: const FlexSubThemesData(
    thinBorderWidth: 1.0,
    thickBorderWidth: 1.0,
    elevatedButtonRadius: 4.0,
    elevatedButtonSchemeColor: SchemeColor.onPrimary,
    elevatedButtonSecondarySchemeColor: SchemeColor.secondary,
    inputDecoratorIsFilled: false,
    inputDecoratorRadius: 4.0,
    inputDecoratorUnfocusedBorderIsColored: false,
    blendOnLevel: 20,
    bottomSheetRadius: 7.0,
    textButtonRadius: 10.0,
    outlinedButtonRadius: 10.0,
    toggleButtonsRadius: 7.0,
    textButtonSchemeColor: SchemeColor.secondary,
    outlinedButtonSchemeColor: SchemeColor.secondary,
    inputDecoratorSchemeColor: SchemeColor.secondary,
    fabRadius: 40.0,
    fabSchemeColor: SchemeColor.primary,
    snackBarBackgroundSchemeColor: SchemeColor.primary,
    chipRadius: 7.0,
    cardRadius: 7.0,
    popupMenuRadius: 7.0,
    bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.secondary,
    bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.primary,
    bottomNavigationBarSelectedIconSchemeColor: SchemeColor.secondary,
    bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.primary,
    navigationBarSelectedLabelSchemeColor: SchemeColor.secondary,
    navigationBarUnselectedLabelSchemeColor: SchemeColor.primary,
    navigationBarSelectedIconSchemeColor: SchemeColor.secondary,
    navigationBarUnselectedIconSchemeColor: SchemeColor.primary,
    navigationRailSelectedLabelSchemeColor: SchemeColor.secondary,
    navigationRailUnselectedLabelSchemeColor: SchemeColor.primary,
    navigationRailSelectedIconSchemeColor: SchemeColor.secondary,
    navigationRailUnselectedIconSchemeColor: SchemeColor.primary,
  ),
  useMaterial3ErrorColors: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  fontFamily: GoogleFonts.roboto().fontFamily,
);

ThemeData MyFlexThemeDataDark = FlexThemeData.dark(
  colorScheme: myFlexSchemeDark,

  appBarStyle: FlexAppBarStyle.scaffoldBackground,
  blendLevel: 15,
  appBarOpacity: 0.90,
  tabBarStyle: FlexTabBarStyle.forBackground,
  tooltipsMatchBackground: true,
  subThemesData: const FlexSubThemesData(
    thinBorderWidth: 1.0,
    thickBorderWidth: 1.0,
    elevatedButtonRadius: 4.0,
    elevatedButtonSchemeColor: SchemeColor.onPrimary,
    elevatedButtonSecondarySchemeColor: SchemeColor.secondary,
    inputDecoratorIsFilled: false,
    inputDecoratorRadius: 4.0,
    inputDecoratorUnfocusedBorderIsColored: false,
    blendOnLevel: 30,
    bottomSheetRadius: 7.0,
    textButtonRadius: 10.0,
    outlinedButtonRadius: 10.0,
    toggleButtonsRadius: 7.0,
    textButtonSchemeColor: SchemeColor.secondary,
    outlinedButtonSchemeColor: SchemeColor.secondary,
    fabRadius: 40.0,
    fabSchemeColor: SchemeColor.primary,
    snackBarBackgroundSchemeColor: SchemeColor.primary,
    chipRadius: 7.0,
    cardRadius: 7.0,
    popupMenuRadius: 7.0,
    bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.secondary,
    bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.primary,
    bottomNavigationBarSelectedIconSchemeColor: SchemeColor.secondary,
    bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.primary,
    navigationBarSelectedLabelSchemeColor: SchemeColor.secondary,
    navigationBarUnselectedLabelSchemeColor: SchemeColor.primary,
    navigationBarSelectedIconSchemeColor: SchemeColor.secondary,
    navigationBarUnselectedIconSchemeColor: SchemeColor.primary,
    navigationRailSelectedLabelSchemeColor: SchemeColor.secondary,
    navigationRailUnselectedLabelSchemeColor: SchemeColor.primary,
    navigationRailSelectedIconSchemeColor: SchemeColor.secondary,
    navigationRailUnselectedIconSchemeColor: SchemeColor.primary,
  ),
  useMaterial3ErrorColors: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
// To use the playground font, add GoogleFonts package and uncomment
// fontFamily: GoogleFonts.notoSans().fontFamily,
  fontFamily: GoogleFonts.roboto().fontFamily,
);
