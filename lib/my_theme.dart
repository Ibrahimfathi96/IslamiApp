import 'package:flutter/material.dart';

class MyThemeData {
  static const Color lightPrimaryColor = Color(0xFFB7935F);
  static const Color darkPrimaryColor = Color(0xFF141A2E);
  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: lightPrimaryColor,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        color: Colors.transparent,
        titleTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 30),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(size: 48),
        unselectedIconTheme: IconThemeData(size: 48),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedLabelStyle:
            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 16),
        backgroundColor: lightPrimaryColor,
      ));
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: darkPrimaryColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      color: Colors.transparent,
      titleTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 30),
    ),
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   // selectedItemColor: Color(0xFFFACC1D),
    //   selectedItemColor: Colors.black,
    //   unselectedItemColor: Colors.black,
    //   selectedIconTheme: IconThemeData(color:Color(0xFFFACC1D),size: 36),
    //   unselectedIconTheme: IconThemeData(color:Colors.white,size: 28),
    //   unselectedLabelStyle:TextStyle(
    //       fontSize: 12,
    //       fontWeight: FontWeight.bold),
    //   selectedLabelStyle: TextStyle(
    //       fontSize: 14,
    //       fontWeight: FontWeight.bold),
    //   showSelectedLabels: true ,
    //   showUnselectedLabels: false,
    //   backgroundColor: darkPrimaryColor,
    // )
  );
}
