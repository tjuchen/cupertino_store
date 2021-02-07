import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../app_themes.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  AppTheme appTheme;
  ThemeBloc(this.appTheme)
      : super(ThemeState(themeData: appThemeDataMap[appTheme]));

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is ThemeChanged) {
      yield ThemeState(themeData: appThemeDataMap[event.appTheme]);
    }
  }
}
