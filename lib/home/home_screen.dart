import 'package:flutter/material.dart';
import 'package:islami/home/hadeth_tab/hadeth_tab.dart';
import 'package:islami/home/quran_tab/quran_tab.dart';
import 'package:islami/home/radio_tab/radio_tab.dart';
import 'package:islami/home/sebha_tab/sebha_tab.dart';
import 'package:provider/provider.dart';

import '../Providers/settings_provider.dart';
import 'settings_screen/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(settingsProvider.getMainBackGroudImage()),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("islami"),
        ),
        body: tabs[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (newlySelectedIndex) {
            setState(() {
              selectedIndex = newlySelectedIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: const ImageIcon(AssetImage('assets/images/ic_quran.png')),
                label: 'Quran'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon:
                    const ImageIcon(AssetImage('assets/images/ic_hadeth.png')),
                label: 'Hadeth'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: const ImageIcon(AssetImage('assets/images/sebha.png')),
                label: 'Tasbeh'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: const ImageIcon(AssetImage('assets/images/radio.png')),
                label: 'Radio'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: const Icon(Icons.settings),
                label: 'Settings'),
          ],
        ),
      ),
    );
  }

  List<Widget> tabs = [
    QuranScreenContent(),
    HadethScreenContent(),
    SebhaScreenContent(),
    RadioScreenContent(),
    SettingsTab()
  ];
}
