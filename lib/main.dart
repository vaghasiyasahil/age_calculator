import 'package:age_calculator/Page/Home_Page.dart';
import 'package:age_calculator/Services/Preferences.dart';
import 'package:age_calculator/Services/Translat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Services/DataHandle.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.iniMemory();
  runApp(
    GetMaterialApp(
      translations: Translat(),
      locale: Locale('${Preferences.getLanguage()}', '${Preferences.getCountryCode()}'),
      fallbackLocale: Locale('${Preferences.getLanguage()}','${Preferences.getCountryCode()}'),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
  );
}