import 'package:flutter/material.dart';
import 'package:islami/home/sura_details/sura_details_arguments.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = 'sura - details';

  @override
  Widget build(BuildContext context) {
    //receive arguments / parameters
    //down casting convert from type Object to type of SuraDetailsArgs
    SuraDetailsArgs arguments =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bg3.png'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("إسلامي"),
        ),
        body: Container(
          alignment: Alignment.center,
          margin:
              const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 60),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Text(
                      " سورة ${arguments.name}",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 26),
                    ),
                  ),
                  const Expanded(
                    flex: 3,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 3,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
