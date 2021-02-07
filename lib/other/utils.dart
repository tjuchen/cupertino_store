import 'package:cupertinostore/model/app_state_model.dart';
import 'package:cupertinostore/theme/app_themes.dart';
import 'package:flutter/material.dart';

AssetImage appBundleImage(String name) {
  if (name == null) return null;
  String iconPath = 'lib/image/' + name + '.png';
  return AssetImage(iconPath);
}

bool isDarkModule() {
  if (sharedPreferences == null ||
      !sharedPreferences.containsKey('isDarkBrightness')) return false;
  return sharedPreferences.getBool('isDarkBrightness');
}

void setDarkModule(bool flag) {
  if (sharedPreferences == null) return;
  sharedPreferences.setBool('isDarkBrightness', flag);
}

AppTheme getCurrentTheme() {
  if (sharedPreferences == null ||
      !sharedPreferences.containsKey('currentTheme'))
    return AppTheme.AppTheme_Light;
  return appThemeStringMap[sharedPreferences.get('currentTheme')];
}

void setCurrentTheme(AppTheme appTheme) {
  if (appTheme == null || sharedPreferences == null) return;
  sharedPreferences.setString('currentTheme', appTheme.toString());
}
