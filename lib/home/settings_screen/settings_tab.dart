import 'package:flutter/material.dart';
import 'package:islami/home/settings_screen/theme_bottom_sheet.dart';

class SettingsTab extends StatefulWidget {
  static const String routeName = 'settings-screen';

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Text(
              'Theme',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showThemeButtonSheet();
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Theme.of(context).accentColor)),
              padding: const EdgeInsets.all(12),
              child: Text(
                'Light',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Text(
              'Language',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showThemeButtonSheet();
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Theme.of(context).accentColor)),
              padding: const EdgeInsets.all(12),
              child: Text(
                'English',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          )
        ],
      ),
    );
  }

  void showThemeButtonSheet() {
    showModalBottomSheet(
      context: context,
      builder: (builderContext) => ThemeBottomSheet(),
    );
  }
}
