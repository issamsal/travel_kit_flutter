import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_trip_ui/constants/common.dart';
import 'package:new_trip_ui/models/enum.dart';

import '../logic/providers/theme_provider.dart';

class AppTheme {
  static bool get isLightTheme {
    try {
      return Get.find<ThemeController>().isLightMode;
    } catch (e) {
      return true;
    }
  }

  static FontFamilyType get fontFamiliType {
    try {
      return Get.find<ThemeController>().fontType;
    } catch (e) {
      return FontFamilyType.workSans;
    }
  }

  static Color get primaryColor =>
      isLightTheme ? const Color(0xFFFE8B88) : const Color(0xFFFE8B88);
  static Color get greenColor =>
      isLightTheme ? const Color(0xFF7ED321) : const Color(0xFF7ED321);
  static Color get yellowColor =>
      isLightTheme ? const Color(0xFFFFCC78) : const Color(0xFFFFCC78);
  static Color get primaryDarkColor =>
      isLightTheme ? const Color(0Xfff04265) : const Color(0Xfff04265);

  static Color get backgroundColor =>
      isLightTheme ? const Color(0xFFFFFFFF) : const Color(0xFF2C2C2C);
  static Color get scaffoldBackgroundColor =>
      isLightTheme ? const Color(0xFFF7F7F7) : const Color(0xFF1A1A1A);
  static Color get greyBackgroundColor =>
      isLightTheme ? const Color(0xFFe6e6e6) : const Color(0xFFe6e6e6);
  static Color get secondaryTextColor =>
      isLightTheme ? const Color(0xFFADADAD) : const Color(0xFF7E7E7E);
  static List<Color> get regularGradient => isLightTheme
      ? [
          const Color(0xFFFF6699),
          const Color(0xFFFD9066),
        ]
      : [
          const Color(0xFFFF6699),
          const Color(0xFFFD9066),
        ];

  static Color get darkTextColor =>
      isLightTheme ? const Color(0xFF242424) : const Color(0xFF242424);
  static Color get primaryTextColor =>
      isLightTheme ? const Color(0xFF242424) : const Color(0xFFFFFFFF);

  static Color get lightTextColor =>
      isLightTheme ? const Color(0xff999999) : const Color(0xff999999);
  static Color get whiteTextColor =>
      isLightTheme ? const Color(0xFFFFFFFF) : const Color(0xFF181818);

  static Color get hintTextColor => const Color(0xFFFBFBFB);
  static Color get whiteColor => const Color(0xFFFFFFFF);
  static Color get blackColor => const Color(0xFF242424);
  static Color get sliderColor => const Color(0xFFEFEFEF);
  static Color get lightGrayColor =>
      Theme.of(applicationcontext!).disabledColor;

  static ThemeData get getThemeData =>
      isLightTheme ? _buildLightTheme() : _buildDarkTheme();

  static TextTheme _buildTextTheme(TextTheme base) {
    // final getFamiliType = Get.find<ThemeProvider>().fontFamiliType;
    return base.copyWith(
      headline1: getTextStyle(fontFamiliType, base.headline1!), //f-size 96
      headline2: getTextStyle(fontFamiliType, base.headline2!), //f-size 60
      headline3: getTextStyle(fontFamiliType, base.headline3!), //f-size 48
      headline4: getTextStyle(fontFamiliType, base.headline4!), //f-size 34
      headline5: getTextStyle(fontFamiliType, base.headline5!), //f-size 24
      headline6: getTextStyle(
        fontFamiliType,
        base.headline6!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ), //f-size 20
      button: getTextStyle(fontFamiliType, base.button!), //f-size 14
      caption: getTextStyle(fontFamiliType, base.caption!), //f-size 12
      bodyText1: getTextStyle(fontFamiliType, base.bodyText1!), //f-size 16
      bodyText2: getTextStyle(fontFamiliType, base.bodyText2!), //f-size 14
      subtitle1: getTextStyle(
        fontFamiliType,
        base.subtitle1!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ), //f-size 16
      subtitle2: getTextStyle(fontFamiliType, base.subtitle2!), //f-size 14
      overline: getTextStyle(fontFamiliType, base.overline!), //f-size 10
    );
  }

  static TextStyle getTextStyle(
      FontFamilyType famlilyType, TextStyle textStyle) {
    switch (famlilyType) {
      case FontFamilyType.workSans:
        return GoogleFonts.workSans(textStyle: textStyle);
      case FontFamilyType.dancingScript:
        return GoogleFonts.dancingScript(textStyle: textStyle);
      case FontFamilyType.kaushanScript:
        return GoogleFonts.kaushanScript(textStyle: textStyle);
      case FontFamilyType.montserrat:
        return GoogleFonts.montserrat(textStyle: textStyle);
      case FontFamilyType.satisfy:
        return GoogleFonts.satisfy(textStyle: textStyle);
      case FontFamilyType.varela:
        return GoogleFonts.varela(textStyle: textStyle);
      default:
        return GoogleFonts.roboto(textStyle: textStyle);
    }
  }

  static ThemeData _buildLightTheme() {
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: primaryColor,
    );
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      backgroundColor: backgroundColor,
      canvasColor: scaffoldBackgroundColor,
      buttonTheme: _buttonThemeData(colorScheme),
      dialogTheme: _dialogTheme(),
      cardTheme: _cardTheme(),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.textTheme),
      platform: TargetPlatform.iOS,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ThemeData _buildDarkTheme() {
    final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
      primary: primaryColor,
      secondary: primaryColor,
    );
    final ThemeData base = ThemeData.dark();

    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      backgroundColor: backgroundColor,
      canvasColor: scaffoldBackgroundColor,
      buttonTheme: _buttonThemeData(colorScheme),
      dialogTheme: _dialogTheme(),
      cardTheme: _cardTheme(),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.textTheme),
      platform: TargetPlatform.iOS,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ButtonThemeData _buttonThemeData(ColorScheme colorScheme) {
    return ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    );
  }

  static DialogTheme _dialogTheme() {
    return DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }

  static CardTheme _cardTheme() {
    return CardTheme(
      // clipBehavior: Clip.antiAlias,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      elevation: 4,
      margin: const EdgeInsets.all(0),
    );
  }
}
