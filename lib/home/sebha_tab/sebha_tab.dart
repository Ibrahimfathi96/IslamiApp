import 'package:flutter/material.dart';

class SebhaScreenContent extends StatefulWidget {
  @override
  State<SebhaScreenContent> createState() => _SebhaScreenContentState();
}

class _SebhaScreenContentState extends State<SebhaScreenContent> {
  int sebha_counter = 0;
  String sebha_text = 'سبحان الله';

  @override
  Widget build(BuildContext context) {
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
              'assets/images/sebha_header.png',
              width: 232,
              height: 312,
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          const Text(
            "عدد التسبيحات",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 22,
          ),
          Container(
            alignment: Alignment.center,
            width: 69,
            height: 81,
            decoration: BoxDecoration(
                color: const Color(0x91B89360),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              '$sebha_counter',
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Container(
            alignment: Alignment.center,
            width: 137,
            height: 51,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              sebha_text,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
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
