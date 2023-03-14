import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:islami/home/radio_tab/radio_controller.dart';
import 'package:islami/radio_models/RadioResponse.dart';

class RadioScreenContent extends StatefulWidget {
  @override
  State<RadioScreenContent> createState() => _RadioScreenContentState();
}

class _RadioScreenContentState extends State<RadioScreenContent> {
  late Future<RadioResponse> responseRadio;
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    responseRadio = getRadio();
    audioPlayer = AudioPlayer();
  }

  play(String url) async {
    int result = await audioPlayer.play(url);
  }

  pause() async {
    await audioPlayer.pause();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RadioResponse>(
      future: responseRadio,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return
              // Text(snapshot.data?.radios?[0].name ?? '', style:TextStyle(color: Colors.white),);
              Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    'assets/images/radio_header.png',
                    // width: 412,
                    // height: 222,
                    // fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      // physics: ,
                      itemCount: snapshot.data!.radios!.length,
                      itemBuilder: (context, index) => RadioController(
                          radioresponse: snapshot.data!.radios![index],
                          pause: pause,
                          play: play)),
                )
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return IconButton(
            onPressed: () {
              responseRadio = getRadio();
            },
            icon: Icon(Icons.refresh,
                size: 40, color: Theme.of(context).primaryColor),
          );
        } else {
          // still loading data
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        }
      },
    );
  }

  Future<RadioResponse> getRadio() async {
    final response = await http
        .get(Uri.parse('http://api.mp3quran.net/radios/radio_arabic.json'));
    if (response.statusCode == 200) {
      return RadioResponse.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load data from server');
    }
  }
}
