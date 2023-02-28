import 'package:flutter/material.dart';

class RadioScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/radio_header.png',
            width: 412,
            height: 222,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'إذاعة القرآن الكريم',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                iconSize: 40,
                onPressed: () {},
                icon: Icon(
                  Icons.skip_previous,
                  color: Theme.of(context).accentColor,
                ),
              ),
              IconButton(
                iconSize: 60,
                onPressed: () {},
                icon: Icon(
                  Icons.play_arrow,
                  color: Theme.of(context).accentColor,
                ),
              ),
              IconButton(
                iconSize: 40,
                onPressed: () {},
                icon: Icon(
                  Icons.skip_next,
                  color: Theme.of(context).accentColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
