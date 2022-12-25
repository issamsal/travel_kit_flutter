import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:get/get.dart';
import 'package:new_trip_ui/constants/common.dart' as c;
import 'package:new_trip_ui/constants/common.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/logic/providers/theme_provider.dart';
import 'package:new_trip_ui/main.dart';
import 'package:new_trip_ui/page/home/home.dart';
import 'package:new_trip_ui/page/login/login_screen.dart';
import 'package:new_trip_ui/page/splashscreen/introduction_screen.dart';
import 'package:new_trip_ui/page/splashscreen/spalsh_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    applicationcontext = context;
    return GetBuilder<ThemeController>(
      builder: (_) {
        final ThemeData theme = AppTheme.getThemeData;
        return GetBuilder<Loc>(
          builder: (controller) {
            return GetMaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: const [
                Locale('en'),
                Locale('de'),
                Locale('ar'),
              ],
              navigatorKey: c.navigatorKey,
              title: 'Trip',
              locale: controller.locale,
              debugShowCheckedModeBanner: false,
              theme: theme,
              routes: _buildRoutes(),
              initialBinding: AppBinding(),
              builder: (BuildContext context, Widget? child) {
                _setFirstTimeSomeData(context, theme);
                return Directionality(
                  textDirection: controller.locale.languageCode == "ar"
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: Builder(
                    builder: (BuildContext context) {
                      return MediaQuery(
                        key: ValueKey(
                            'languageCode ${controller.locale.languageCode}'),
                        data: MediaQuery.of(context).copyWith(
                          textScaleFactor:
                              MediaQuery.of(context).size.width > 360
                                  ? 1.0
                                  : MediaQuery.of(context).size.width >= 340
                                      ? 0.9
                                      : 0.8,
                        ),
                        child: child!,
                      );
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Map<String, Widget Function(BuildContext)> _buildRoutes() {
    return {
      Routes.splash: (BuildContext context) => const SplashPage(),
      Routes.introduction: (BuildContext context) => const IntroductionScreen(),
      Routes.login: (BuildContext context) => const LogInScreen(),
      Routes.home: (BuildContext context) => const HomeScreen(),
    };
    // Routes.Account: (BuildContext context) => AccountScreen(),
  }

  void _setFirstTimeSomeData(BuildContext context, ThemeData theme) {
    _setStatusBarNavigationBarTheme(theme);
    //we call some theme basic data set in app like color, font, theme mode, language

    Get.find<ThemeController>()
        .checkAndSetThemeMode(MediaQuery.of(context).platformBrightness);
  }

  void _setStatusBarNavigationBarTheme(ThemeData themeData) {
    final brightness = !kIsWeb && Platform.isAndroid
        ? themeData.brightness == Brightness.light
            ? Brightness.dark
            : Brightness.light
        : themeData.brightness;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: brightness,
      statusBarBrightness: brightness,
      systemNavigationBarColor: themeData.scaffoldBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: brightness,
    ));
  }
}

class Routes {
  static const String splash = '/';
  static const String introduction = '/introductionScreen';
  static const String login = '/login';
  static const String home = '/home';
  static const String account = '/account';
}
