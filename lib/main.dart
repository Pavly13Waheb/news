import 'package:flutter/material.dart';
import 'package:news/app_settings.dart';
import 'package:news/category_screens/business.dart';
import 'package:news/category_screens/environment.dart';
import 'package:news/category_screens/every_thing.dart';
import 'package:news/category_screens/health.dart';
import 'package:news/category_screens/politics.dart';
import 'package:news/category_screens/sports.dart';
import 'package:news/provider.dart';
import 'package:news/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'category_screens/science.dart';
import 'home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iniSharedPref();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);

    return MaterialApp(
      themeMode: provider.currentTheme,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      title: 'Localizations Sample App',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(provider.currentLocale),
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        AppSettings.routeName: (_) => AppSettings(),
        Environment.routeName: (_) => Environment(),
        Health.routeName: (_) => Health(),
        Politics.routeName: (_) => Politics(),
        Science.routeName: (_) => Science(),
        Sports.routeName: (_) => Sports(),
        Business.routeName: (_) => Business(),
        NewsEverything.routeName: (_)=> NewsEverything()
      },
      initialRoute: HomePage.routeName,
    );
  }

  iniSharedPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString("lang") ?? "en";
    String theme = prefs.getString("theme") ?? "light";

    provider.changeLanguage(lang);
    provider.changeTheme(theme == "light" ? ThemeMode.light : ThemeMode.dark);
  }
}
