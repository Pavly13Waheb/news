import 'package:flutter/material.dart';
import 'package:news/model/app_settings.dart';
import 'package:news/category_screens/every_thing.dart';
import 'package:news/provider/provider.dart';
import 'package:news/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
