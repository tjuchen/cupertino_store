import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AppTheme {
  AppTheme_Light,
  AppTheme_Dark,
}

final appThemeStringMap = {
  'AppTheme.AppTheme_Light': AppTheme.AppTheme_Light,
  'AppTheme.AppTheme_Dark': AppTheme.AppTheme_Dark,
};

final appThemeDataMap = {
  AppTheme.AppTheme_Light: CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    // textTheme:
    //     CupertinoTextThemeData(textStyle: TextStyle(color: Color(0xFF333333))),
  ),
  AppTheme.AppTheme_Dark: CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    textTheme:
        CupertinoTextThemeData(textStyle: TextStyle(color: Color(0xFF000000))),
  ),
};
