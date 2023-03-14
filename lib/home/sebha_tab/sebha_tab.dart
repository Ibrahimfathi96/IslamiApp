import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:provider/provider.dart';

class SebhaScreenContent extends StatefulWidget {
  @override
  State<SebhaScreenContent> createState() => _SebhaScreenContentState();
}

class _SebhaScreenContentState extends State<SebhaScreenContent> {
  int sebha_counter = 0;
  String sebha_text = 'سبحان الله';

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                onSebhaClicks();
              });
            },
            child: Image.asset(
              /// TODO Make sebha header image body rotatable
              settingsProvider.currentTheme == ThemeMode.dark
                  ? 'assets/images/sebha_dark.png'
                  : 'assets/images/sebha_header.png',
              width: 232,
              height: 312,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Text(AppLocalizations.of(context)!.mention_number,
              style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(
            height: 22,
          ),
          Container(
            alignment: Alignment.center,
            width: 69,
            height: 81,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: Text(
                '$sebha_counter',
                style: Theme.of(context).textTheme.headlineLarge),
          ),
          const SizedBox(
            height: 22,
          ),
          Container(
            alignment: Alignment.center,
            width: 137,
            height: 51,
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(20)),
            child: Text(
                sebha_text,
                style: Theme.of(context).textTheme.headlineLarge),
          ),
        ],
      ),
    );
  }

  onSebhaClicks() {
    if (sebha_counter < 33) {
      sebha_text = 'سبحان الله';
      sebha_counter++;
    } else if (sebha_counter < 66) {
      sebha_text = 'الحمدلله';
      sebha_counter++;
    } else if (sebha_counter < 99) {
      sebha_text = 'الله اكبر';
      sebha_counter++;
    } else if (sebha_counter < 100) {
      sebha_text = 'لا إله إلا الله';
      sebha_counter = 0;
    }
  }
}
