import 'package:flutter/material.dart';
import 'package:islami/radio_models/Radios.dart';

class RadioController extends StatefulWidget {
  Radios radioresponse;
  Function play;
  Function pause;

  RadioController(
      {required this.radioresponse, required this.pause, required this.play});

  @override
  State<RadioController> createState() => _RadioControllerState();
}

class _RadioControllerState extends State<RadioController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            // AppLocalizations.of(context)!.radio_title,
            widget.radioresponse.name ?? '',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                iconSize: 50,
                onPressed: () {
                  widget.play(widget.radioresponse.radioUrl);
                },
                icon: Icon(
                  Icons.play_circle_outline,
                  color: Theme.of(context).accentColor,
                ),
              ),
              IconButton(
                iconSize: 50,
                onPressed: () {
                  widget.pause();
                },
                icon: Icon(
                  Icons.pause_circle_outline,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
