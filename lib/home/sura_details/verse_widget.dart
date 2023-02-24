import 'package:flutter/material.dart';

class VerseWidget extends StatelessWidget {
  String content;
  int index;

  VerseWidget(this.content, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      child: Text(
        '$content [$index]',
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 22,
            fontFamily: 'El-Messi-ri',
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
