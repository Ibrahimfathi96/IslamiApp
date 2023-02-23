import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/sura_details/sura_details_arguments.dart';
import 'package:islami/home/sura_details/verse_widget.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura - details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    //receive arguments / parameters
    //down casting convert from type Object to type of SuraDetailsArgs
    SuraDetailsArgs arguments =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    // read files of content then build but not blocking it
    if (verses.isEmpty) readVersesContent(arguments.index + 1); //non blocking
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bg3.png'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("إسلامي"),
        ),
        body: Card(
          color: Colors.white60,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          margin:
              const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 60),
          elevation: 26,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                const SizedBox(
                  width: 6,
                ),
                Row(
                  children: [
                    const Spacer(flex: 3),
                    Text(
                      " سورة ${arguments.name}",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontFamily: "El-Messi-ri",
                          fontWeight: FontWeight.w500,
                          fontSize: 26),
                    ),
                    const Spacer(flex: 1),
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
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
                  color: Theme.of(context).primaryColor,
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
                                  color: Theme.of(context).primaryColor,
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
    //blocking code // you can't use await function without being async function
    String fileContent =
        await rootBundle.loadString('assets/sura_content/$fileIndex.txt');
    // we need to separate every verse in a line
    List<String> verseLines = fileContent.trim().split('\n');
    print(verseLines);
    setState(() {
      verses = verseLines;
    });

    //show in ListView
  }
}
