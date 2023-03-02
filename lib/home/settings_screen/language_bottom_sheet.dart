import 'package:flutter/material.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              settingsProvider.getLang('en');
            },
            child: settingsProvider.currentLang == 'en'
                ? getSelectedIcon('English')
                : getUnSelectedIcon('English'),
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              settingsProvider.getLang('ar');
            },
            child: settingsProvider.currentLang == 'ar'
                ? getSelectedIcon('العربية')
                : getUnSelectedIcon('العربية'),
          ),
        ],
      ),
    );
  }

  Widget getSelectedIcon(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Theme.of(context).accentColor),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).accentColor,
          size: 30,
        )
      ],
    );
  }

  Widget getUnSelectedIcon(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
