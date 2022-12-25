import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/logic/providers/google_map_provider.dart';

import 'logic/providers/theme_provider.dart';
import 'my_app.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<Loc>(() => Loc().init(), permanent: true);
  await Get.putAsync<ThemeController>(() => ThemeController.init(),
      permanent: true);
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(_setAllProviders()));
} 

Widget _setAllProviders() {
  return const MyApp();
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GoogleMapProvider>(GoogleMapProvider());
  }
}
