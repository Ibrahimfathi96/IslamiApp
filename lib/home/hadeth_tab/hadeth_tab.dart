import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/hadeth_tab/hadeth_model_class.dart';

import 'hadeth_title_widget.dart';

class HadethScreenContent extends StatefulWidget {
  @override
  State<HadethScreenContent> createState() => _HadethScreenContentState();
}

class _HadethScreenContentState extends State<HadethScreenContent> {
  List<Hadeth> allHadethList = [];

  @override
  Widget build(BuildContext context) {
    if (allHadethList.isEmpty) loadAhadethFile();
    return Column(
      children: [
        Center(
          child: Image.asset(
            'assets/images/hadeth_header.png',
            height: 219,
            width: 312,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          height: 2,
          color: Theme.of(context).accentColor,
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(AppLocalizations.of(context)!.hadiths,
              style: Theme.of(context).textTheme.headlineLarge),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          height: 2,
          color: Theme.of(context).accentColor,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (buildContext, index) =>
                HadethTitleWidget(allHadethList[index]),
            separatorBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 64),
              height: 2,
              color: Theme.of(context).accentColor,
            ),
            itemCount: allHadethList.length,
          ),
        ),
      ],
    );
  }

  void loadAhadethFile() async {
    List<Hadeth> hadethList = [];
    String content =
        await rootBundle.loadString('assets/sura_content/ahadeth.txt');
    List<String> allHadethContent = content.split('#');
    for (int i = 0; i < allHadethContent.length; i++) {
      String singleHadeth = allHadethContent[i].trim();
      //first solution to split the hadeth content to title and hadeth content
      int indexOfFirstLine = singleHadeth.indexOf('\n');
      String title = singleHadeth.substring(0, indexOfFirstLine);
      String content = singleHadeth.substring(indexOfFirstLine + 1);
      final h = Hadeth(title, content);
      hadethList.add(h);

      //another solution
      //List<String>singleHadethLines = singleHadeth.trim().split('\n');
      //String title = singleHadethLines[0];
      //singleHadethLines.elementAt(0);
      //String content = singleHadethLines.join('\n');
    }
    allHadethList = hadethList;
    setState(() {});
  }
}
