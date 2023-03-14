import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:islami/home/settings_screen/settings_tab.dart';
import 'package:islami/home/sura_details/sura_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/hadeth_details/hadeth_details_screen.dart';
import 'home/home_screen.dart';
import 'my_theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (buildContext) => SettingsProvider(), child: MyApplication()));
}

class MyApplication extends StatelessWidget {
  late SettingsProvider settingsProvider;

  @override
  Widget build(BuildContext context) {
    settingsProvider = Provider.of(context);
    getValueFromSharedPreferences();
    return MaterialApp(
      locale: Locale(settingsProvider.currentLang),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: settingsProvider.currentTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
        SettingsTab.routeName: (_) => SettingsTab(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }

  getValueFromSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    // set lang from sharedPreferences
    settingsProvider.getLang(pref.getString('lang') ?? 'ar');
    // set theme from sharedPreferences
    if (pref.getString('theme') == 'light') {
      settingsProvider.changeTheme(ThemeMode.light);
    } else if (pref.getString('theme') == 'dark') {
      settingsProvider.changeTheme(ThemeMode.dark);
    }
  }
}
