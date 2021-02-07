import 'package:cupertinostore/model/app_state_model.dart';
import 'package:cupertinostore/model/click_repository.dart';
import 'package:flutter/cupertino.dart';

import 'user_info.dart';
import 'setting_item.dart';

class MyRepository {
  static const _userInfoData =
      User(id: 01, name: '陈耀', avatar: 'avatar', subscribe: '大帅比就是我，我就是大帅比');

  User getUserInfoData() {
    return _userInfoData;
  }

  static const _systemSettingData = <SettingItem>[
    SettingItem(
        icon: 'wallet',
        title: '钱包',
        subTitle: '\$${20.00}',
        switchType: SwitchType.SwitchType_None),
    SettingItem(
        icon: 'headset',
        title: '帮助',
        subTitle: null,
        switchType: SwitchType.SwitchType_None),
    SettingItem(
        icon: 'chatbox-ellipses',
        title: '消息',
        subTitle: '无未读消息',
        switchType: SwitchType.SwitchType_None),
    SettingItem(
        icon: 'notifications',
        title: '通知',
        subTitle: null,
        switchType: SwitchType.SwitchType_None),
    SettingItem(
        icon: 'cog',
        title: '设置',
        subTitle: null,
        switchType: SwitchType.SwitchType_None),
  ];

  List getSystemSettingData() {
    return _systemSettingData;
  }

  static const _appearanceSettingData = <SettingItem>[
    SettingItem(
      icon: 'toggle',
      title: '夜间模式',
      subTitle: null,
      switchType: SwitchType.SwitchType_Close,
      clickEventType: ClickEventType.ClickEventType_DarkModule,
    ),
  ];

  List getAppearanceSettingData() {
    return _appearanceSettingData;
  }

  void setNightModelValue(SwitchType type) {
    if (type == SwitchType.SwitchType_Open) {
      sharedPreferences.setBool('night_mode', true);
    } else if (type == SwitchType.SwitchType_Close) {
      sharedPreferences.setBool('night_mode', false);
    } else {}
  }

  SwitchType getNightModelValue() {
    bool value = sharedPreferences.getBool('night_mode');
    if (value == null) return SwitchType.SwitchType_Close;
    return value == true
        ? SwitchType.SwitchType_Open
        : SwitchType.SwitchType_Close;
  }

  static const _myRepositoryList = [
    'UserInfoData',
    'SystemSettingData',
    'AppearanceSettingData'
  ];
  List getMyRepositoryList() {
    return _myRepositoryList;
  }

  var _myRepositoryMap = {
    'UserInfoData': _userInfoData,
    'SystemSettingData': _systemSettingData,
    'AppearanceSettingData': _appearanceSettingData,
  };
  Map getMyRepositoryMap() {
    return _myRepositoryMap;
  }

  ItemObject getItem(int index) {
    if (index < 1) {
      return ItemObject(
          objc: _userInfoData, type: 0, isFirstItem: true, isLastItem: true);
    } else if (index == 1) {
      return ItemObject(
          objc: null, type: 3, isFirstItem: false, isLastItem: false);
    } else if (index > 1 && index <= 1 + _systemSettingData.length) {
      bool isFirstItem = index == 2;
      bool isLastItem = index == (_systemSettingData.length + 1);
      return ItemObject(
          objc: _systemSettingData[index - 2],
          type: 1,
          isFirstItem: isFirstItem,
          isLastItem: isLastItem);
    } else if (index == 2 + _systemSettingData.length) {
      return ItemObject(
          objc: null, type: 3, isFirstItem: false, isLastItem: false);
    } else if (index >= 3 + _systemSettingData.length &&
        index < 3 + _systemSettingData.length + _appearanceSettingData.length) {
      bool isFirstItem = index == (3 + _systemSettingData.length);
      bool isLastItem = index ==
          (2 + _systemSettingData.length + _appearanceSettingData.length);
      return ItemObject(
          objc: _appearanceSettingData[index - 3 - _systemSettingData.length],
          type: 2,
          isFirstItem: isFirstItem,
          isLastItem: isLastItem);
    } else {
      return null;
    }
  }
}

class ItemObject {
  const ItemObject(
      {@required this.objc,
      @required this.type,
      @required this.isFirstItem,
      @required this.isLastItem})
      : assert(type != null),
        assert(isFirstItem != null),
        assert(isLastItem != null);
  final Object objc;
  final int type;
  final bool isFirstItem;
  final bool isLastItem;
}
