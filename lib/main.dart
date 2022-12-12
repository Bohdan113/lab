import 'package:boichuk_lab/app_strings.dart';
import 'package:boichuk_lab/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import 'my_home_page.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

// ignore: constant_identifier_names
const String _PATH_TO_TRANSLATIONS_FILE = 'assets/translations';

// ignore: constant_identifier_names
const String ENGLISH_LOCALE_CODE = 'en';
// ignore: constant_identifier_names
const String UKRAINE_LOCALE_CODE = 'uk';

// ignore: constant_identifier_names
const String UK_COUNTRY_CODE = 'united_kingdom';

const Map<String, Locale> supportedLocales = {
  ENGLISH_LOCALE_CODE: Locale(ENGLISH_LOCALE_CODE),
  UKRAINE_LOCALE_CODE: Locale(UKRAINE_LOCALE_CODE),
};

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: supportedLocales.values.toList(),
      fallbackLocale: supportedLocales[ENGLISH_LOCALE_CODE],
      path: _PATH_TO_TRANSLATIONS_FILE,
      saveLocale: true,
      useOnlyLangCode: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Boichuk Lab',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const SplashScreen(),
    );
  }
}
