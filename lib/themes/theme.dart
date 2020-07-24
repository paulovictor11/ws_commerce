import 'package:flutter/material.dart';

import 'light_color.dart';

class AppTheme {
  const AppTheme();

  static ThemeData lightTheme = new ThemeData(
    backgroundColor: LightColor.background,
    primaryColor: LightColor.background,
    cardTheme: new CardTheme(color: LightColor.background),
    textTheme: new TextTheme(display1: new TextStyle(color: LightColor.black)),
    iconTheme: new IconThemeData(color: LightColor.iconColor),
    bottomAppBarColor: LightColor.background,
    dividerColor: LightColor.lightGrey,
    primaryTextTheme: new TextTheme(
      body1: new TextStyle(color: LightColor.titleTextColor)
    )
  );

  static TextStyle titleStyle = const TextStyle(color: LightColor.titleTextColor, fontSize: 16);
  static TextStyle subTitleStyle = const TextStyle(color: LightColor.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);

  static List<BoxShadow> shadow = <BoxShadow>[
    new BoxShadow(color: Color(0xFFF8F8F8), blurRadius: 10, spreadRadius: 15)
  ];

  static EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets hPadding = const EdgeInsets.symmetric(horizontal: 10);

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}