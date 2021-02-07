import 'package:flutter/material.dart';
import '../model/click_repository.dart';

enum SwitchType {
  SwitchType_None,
  SwitchType_Open,
  SwitchType_Close,
}

class SettingItem {
  const SettingItem({
    @required this.icon,
    @required this.title,
    @required this.subTitle,
    @required this.switchType,
    this.clickEventType,
  })  : assert(title != null),
        assert(switchType != null);

  final String icon;
  final String title;
  final String subTitle;
  final SwitchType switchType;
  final ClickEventType clickEventType;
}
