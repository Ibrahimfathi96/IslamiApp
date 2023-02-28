import 'package:flutter/material.dart';
import 'package:islami/home/hadeth_tab/hadeth_model_class.dart';
import 'package:provider/provider.dart';

import '../../Providers/settings_provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeth-details';

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(settingsProvider.getMainBackGroudImage()),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("islami"),
        ),
        body: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin:
              const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 60),
          elevation: 26,
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(args.title,
                      style: Theme.of(context).textTheme.headlineLarge),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 2,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                color: Theme.of(context).accentColor,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView(
                    children: [
                      Text(args.content,
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.headlineMedium)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
