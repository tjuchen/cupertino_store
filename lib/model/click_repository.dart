import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme/app_themes.dart';
import '../theme/bloc/theme_bloc.dart';
import '../other/utils.dart';
import 'package:cupertinostore/main.dart';

typedef DoNothingCallback = void Function();
DoNothingCallback doNothing;

typedef SwitchDarkModuleCallback<BuildContext, bool> = void Function(
    BuildContext context, bool switchOpen);

enum ClickEventType {
  ClickEventType_None,
  ClickEventType_DarkModule,
}

void switchDarkModule(BuildContext context, bool switchOpen) {
  AppTheme appTheme =
      switchOpen ? AppTheme.AppTheme_Dark : AppTheme.AppTheme_Light;
  BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(appTheme: appTheme));
  setCurrentTheme(appTheme);
  setDarkModule(switchOpen);
  RestartWidget.restartApp(context);
}

SwitchDarkModuleCallback<BuildContext, bool> clickSwitchDarkModule =
    (context, switchOpen) {
  switchDarkModule(context, switchOpen);
};

Map<ClickEventType, Function> clickEventMap = {
  ClickEventType.ClickEventType_None: doNothing,
  ClickEventType.ClickEventType_DarkModule: clickSwitchDarkModule,
};
