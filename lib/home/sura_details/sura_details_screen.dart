import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Providers/settings_provider.dart';
import 'package:islami/home/sura_details/sura_details_arguments.dart';
import 'package:islami/home/sura_details/verse_widget.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura - details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    //receive arguments / parameters
    //down casting convert from type Object to type of SuraDetailsArgs
    SuraDetailsArgs arguments =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    // read files of content then build but not blocking it
    if (verses.isEmpty) readVersesContent(arguments.index + 1); //non blocking
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
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    const Spacer(flex: 3),
                    Text(
                        " سورة ${arguments.name}",
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.headlineLarge),
                    const Spacer(flex: 1),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Theme.of(context).accentColor,
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                        size: 36,
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
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
                verses.isEmpty
                    ? //still reading or loading
                const Center(
                  child: CircularProgressIndicator(),
                )
                    : Expanded(
                  child: ListView.separated(
                      itemBuilder: (_, index) =>
                          VerseWidget(verses[index], index),
                      separatorBuilder: (_, __) => Container(
                        height: 2,
                                  width: double.infinity,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  color: Theme.of(context).accentColor,
                                ),
                      itemCount: verses.length),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // stdin.readLineSync(); //blocking code
  void readVersesContent(int fileIndex) async {
    //async reduce using many call backs
    //blocking code // you can't use await function without being async function
    String fileContent =
        await rootBundle.loadString('assets/sura_content/$fileIndex.txt');
    // we need to separate every verse in a line
    List<String> verseLines = fileContent.trim().split('\n');
    setState(() {
      verses = verseLines;
    });
    //show in ListView
  }
}
