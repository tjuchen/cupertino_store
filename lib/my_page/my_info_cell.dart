import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/user_info.dart';
import '../styles.dart';
import 'package:cupertinostore/other/utils.dart';

class MyInfoCell extends StatefulWidget {
  const MyInfoCell({
    @required this.userInfo,
  });
  final User userInfo;
  @override
  State<StatefulWidget> createState() {
    return _MyInfoCellState(userInfo: userInfo);
  }
}

class _MyInfoCellState extends State<MyInfoCell> {
  _MyInfoCellState({
    @required this.userInfo,
  });
  final User userInfo;

  var bgColor =
      isDarkModule() ? Styles.scaffoldBackgroundDarkColor : Colors.white;
  var nameText =
      isDarkModule() ? Styles.productRowTotalDark : Styles.productRowTotal;
  var subscribeText =
      isDarkModule() ? Styles.searchTextDark : Styles.searchText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Styles.settingRowDividerColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image(
              image: appBundleImage(userInfo.avatar),
              height: 50,
              width: 50,
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  userInfo.name,
                  style: nameText,
                ),
                Text(
                  userInfo.subscribe,
                  style: subscribeText,
                ),
              ],
            ),
          )),
          Icon(
            CupertinoIcons.right_chevron,
            size: 20,
            color: Styles.settingIconColor,
          ),
        ],
      ),
    );
  }
}
