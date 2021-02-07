import 'package:cupertinostore/model/click_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../other/utils.dart';
import '../styles.dart';
import '../model/setting_item.dart';

const double CellHeight = 45;
var _switchOpen = isDarkModule();

class MyNormalCell extends StatefulWidget {
  const MyNormalCell(
      {@required this.settingItem,
      @required this.isFirstItem,
      @required this.isLastItem})
      : assert(settingItem != null),
        assert(isFirstItem != null),
        assert(isLastItem != null);
  final SettingItem settingItem;
  final bool isFirstItem;
  final bool isLastItem;

  @override
  State<StatefulWidget> createState() {
    return _MyNormalCellState(
        settingItem: settingItem,
        isFirstItem: isFirstItem,
        isLastItem: isLastItem);
  }
}

class _MyNormalCellState extends State<MyNormalCell> {
  _MyNormalCellState(
      {@required this.settingItem,
      @required this.isFirstItem,
      @required this.isLastItem})
      : assert(settingItem != null),
        assert(isFirstItem != null),
        assert(isLastItem != null);
  final SettingItem settingItem;
  final bool isFirstItem;
  final bool isLastItem;

  var topBottomBorder = Padding(
    padding: const EdgeInsets.only(
      left: 0,
      right: 0,
    ),
    child: Container(
      height: 1,
      color: Styles.settingRowDividerColor,
    ),
  );
  var normalBorder = Padding(
    padding: const EdgeInsets.only(
      left: 60,
      right: 0,
    ),
    child: Container(
      height: 0.5,
      color: Styles.settingRowDividerColor,
    ),
  );

  var bgColor =
      isDarkModule() ? Styles.scaffoldBackgroundDarkColor : Colors.white;
  var titleText = isDarkModule() ? Styles.searchTextDark : Styles.searchText;
  var subTitleText =
      isDarkModule() ? Styles.settingTextDark : Styles.settingText;
  var iconColor =
      isDarkModule() ? Colors.white : Styles.scaffoldBackgroundDarkColor;

  void _onSwitchChanged(BuildContext context, ClickEventType clickEventType) {
    setState(() {
      _switchOpen = !_switchOpen;
      if (clickEventType == ClickEventType.ClickEventType_DarkModule) {
        clickEventMap[ClickEventType.ClickEventType_DarkModule](
            context, _switchOpen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var row = Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            image: appBundleImage(settingItem.icon),
            width: 25,
            height: 25,
            color: iconColor,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                settingItem.title,
                style: titleText,
              ),
              Text(
                settingItem.subTitle != null ? settingItem.subTitle : '',
                style: subTitleText,
              ),
            ],
          )),
          settingItem.switchType == SwitchType.SwitchType_None
              ? Icon(
                  CupertinoIcons.right_chevron,
                  size: 20,
                  color: Styles.settingIconColor,
                )
              : CupertinoSwitch(
                  value: _switchOpen,
                  onChanged: (bool value) {
                    _onSwitchChanged(context, settingItem.clickEventType);
                  }),
        ],
      ),
    );

    return Container(
      height: CellHeight,
      color: bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          isFirstItem ? topBottomBorder : normalBorder,
          row,
          isLastItem ? topBottomBorder : normalBorder,
        ],
      ),
    );
  }
}
