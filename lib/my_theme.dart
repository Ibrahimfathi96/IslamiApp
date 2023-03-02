import 'package:flutter/material.dart';

class MyThemeData {
  static const Color lightPrimaryColor = Color(0xFFB7935F);
  static const Color darkPrimaryColor = Color(0xFF141A2E);
  static const Color yellow = Color(0xFFFACC1D);
  static final ThemeData lightTheme = ThemeData(
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(18), topLeft: Radius.circular(18)),
          )),
      cardColor: Colors.white,
      accentColor: lightPrimaryColor,
      textTheme: const TextTheme(
          headlineMedium: TextStyle(
              fontSize: 22, color: Colors.black, fontFamily: "El-Messi-ri"),
          headlineLarge: TextStyle(
              fontSize: 28,
              color: Colors.black,
              fontFamily: "El-Messi-ri",
              fontWeight: FontWeight.w400),
          titleSmall: TextStyle(fontSize: 16, color: Colors.black)),
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: lightPrimaryColor,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        color: Colors.transparent,
        titleTextStyle: TextStyle(
            fontFamily: "El-Messi-ri",
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 30),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(size: 48, color: Colors.black),
        unselectedIconTheme: IconThemeData(size: 48, color: Colors.white),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(
            fontFamily: "El-Messi-ri",
            fontSize: 16,
            fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(
          fontSize: 16,
          fontFamily: "El-Messi-ri",
        ),
      ));
  static final ThemeData darkTheme = ThemeData(
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: darkPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24), topLeft: Radius.circular(24)),
          )),
      cardColor: darkPrimaryColor,
      accentColor: yellow,
      textTheme: const TextTheme(
          headlineMedium: TextStyle(
              fontSize: 22, color: Colors.white, fontFamily: "El-Messi-ri"),
          headlineLarge: TextStyle(
              fontSize: 28, color: Colors.white, fontFamily: "El-Messi-ri"),
          titleSmall: TextStyle(fontSize: 16, color: Colors.white)),
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: darkPrimaryColor,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 0,
        color: Colors.transparent,
        titleTextStyle: TextStyle(
            fontFamily: "El-Messi-ri",
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 30),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: yellow,
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(size: 48),
        unselectedIconTheme: IconThemeData(size: 48),
        selectedLabelStyle: TextStyle(
            fontFamily: "El-Messi-ri",
            fontSize: 16,
            fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(
          fontSize: 16,
          fontFamily: "El-Messi-ri",
        ),
        backgroundColor: lightPrimaryColor,
      ));
}
