import 'package:flutter/material.dart';

import '../hadeth_details/hadeth_details_screen.dart';
import 'hadeth_model_class.dart';

class HadethTitleWidget extends StatelessWidget {
  Hadeth hadeth;

  HadethTitleWidget(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(4),
        alignment: Alignment.center,
        child: Text(hadeth.title,
            style: Theme.of(context).textTheme.headlineLarge),
      ),
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,
            arguments: hadeth);
      },
    );
  }
}
