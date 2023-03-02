import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:islami/home/settings_screen/language_bottom_sheet.dart';
import 'package:islami/home/settings_screen/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  static const String routeName = 'settings-screen';

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Text(
              AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.headlineMedium,
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
                settingsProvider.isDarkMode()
                    ? AppLocalizations.of(context)!.dark
                    : AppLocalizations.of(context)!.light,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Text(
              AppLocalizations.of(context)!.lang,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showLangButtonSheet();
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Theme.of(context).accentColor)),
              padding: const EdgeInsets.all(12),
              child: Text(
                settingsProvider.currentLang == 'en' ? 'English' : 'العربية',
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

  void showLangButtonSheet() {
    showModalBottomSheet(
      context: context,
      builder: (buildContext) => LanguageBottomSheet(),
    );
  }
}
