import 'package:flutter/material.dart';
import 'package:islami/home/sura_details/sura_details_arguments.dart';

import '../sura_details/sura_details_screen.dart';

class SuraTitleWidget extends StatefulWidget {
  String title;
  int index;

  SuraTitleWidget(this.title, this.index);

  @override
  State<SuraTitleWidget> createState() => _SuraTitleWidgetState();
}

class _SuraTitleWidgetState extends State<SuraTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(4),
        alignment: Alignment.center,
        child: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 26,
            fontFamily: "El-Messi-ri",
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
            arguments:
                SuraDetailsArgs(name: widget.title, index: widget.index));
        setState(() {});
      },
    );
  }
}
