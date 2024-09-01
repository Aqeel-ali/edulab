import 'package:flutter/material.dart';

import 'package:flutter/animation.dart';

var logo = 'assets/image/Edulab.png';

Color primColor = Color.fromRGBO(240, 240, 240, 1);
Color white = Color.fromRGBO(255, 255, 255, 1);

Color ScoColor = Color.fromRGBO(190, 190, 190, 1);
Color scoColor2 = Color.fromRGBO(184, 184, 184, 1);
Color butColor = Color.fromRGBO(47, 47, 49, 1);
Color butColor2 = Color.fromRGBO(53, 52, 52, 1);
Color squColor2 = Color.fromRGBO(168, 183, 212, 1);
Color squColor3 = Color.fromRGBO(38, 149, 172, 1);
Color DarkColor = Colors.black87;

class theme {
  // light theme
  ThemeData lightTheme = ThemeData(
    iconTheme: IconThemeData(color: butColor2),
    primaryColor: primColor,
    scaffoldBackgroundColor: primColor,
    appBarTheme: AppBarTheme(
      backgroundColor: primColor,
      elevation: 0,
      iconTheme: IconThemeData(color: butColor2),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(butColor2),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: butColor2,
      unselectedItemColor: butColor2,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: squColor3,
      selectionColor: squColor3,
      selectionHandleColor: squColor2,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      floatingLabelStyle: TextStyle(color: Colors.black, fontSize: 18),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: Colors.white,
    ),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            iconColor: MaterialStateProperty.all<Color>(butColor2))),
    colorScheme: ColorScheme.light(
      primary: primColor,
      secondary: butColor2,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: butColor,
      textTheme: ButtonTextTheme.primary,
    ),
    fontFamily: "tajawal",
    useMaterial3: true,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: butColor2,
    ),
  );

  // dark theme
  ThemeData darkTheme = ThemeData(
    cardColor: butColor,
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(butColor),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(white),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    scaffoldBackgroundColor: DarkColor,
    appBarTheme: AppBarTheme(
      backgroundColor: DarkColor,
      elevation: 0,
      iconTheme: IconThemeData(color: butColor2),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: squColor3,
      selectionColor: squColor3,
      selectionHandleColor: squColor2,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: butColor,
      filled: true,
      labelStyle: TextStyle(color: ScoColor, fontSize: 18),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    primaryColorDark: squColor3,
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            iconColor: MaterialStateProperty.all<Color>(Colors.grey[400]!))),
    iconTheme: IconThemeData(color: Colors.grey[400]),
    listTileTheme: ListTileThemeData(
      tileColor: butColor,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: butColor,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: ColorScheme.dark(
      primary: butColor,
      secondary: butColor2,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: butColor,
      selectedItemColor: butColor2,
      unselectedItemColor: butColor2,
    ),
    primaryColor: butColor,
    brightness: Brightness.dark,
    fontFamily: 'tajawal',
    useMaterial3: true,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: butColor2,
      foregroundColor: Colors.white,
    ),
  );
}
