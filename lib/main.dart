import 'package:flutter/material.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:islami/home/settings_screen/settings_tab.dart';
import 'package:islami/home/sura_details/sura_details_screen.dart';
import 'package:provider/provider.dart';

import 'home/hadeth_details/hadeth_details_screen.dart';
import 'home/home_screen.dart';
import 'my_theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (buildContext) => SettingsProvider(), child: MyApplication()));
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
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
}
