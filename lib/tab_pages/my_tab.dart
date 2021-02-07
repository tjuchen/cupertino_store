import 'package:cupertinostore/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

import '../model/app_state_model.dart';
import 'package:cupertinostore/model/my_repository.dart';
import 'package:cupertinostore/my_page/my_info_cell.dart';
import 'package:cupertinostore/my_page/my_normal_cell.dart';
import 'package:cupertinostore/other/utils.dart';

class MyTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyTabState();
  }
}

class _MyTabState extends State<MyTab> {
  var bgColor = isDarkModule()
      ? Styles.scaffoldBackgroundDarkColor
      : Styles.settingBackgroundColor;

  SliverChildBuilderDelegate _sliverChildBuilderDelegate() {
    return SliverChildBuilderDelegate((context, index) {
      ItemObject item = MyRepository().getItem(index);
      if (item == null) return null;
      switch (item.type) {
        case 0:
          return MyInfoCell(userInfo: item.objc);
          break;
        case 1:
          return MyNormalCell(
              settingItem: item.objc,
              isFirstItem: item.isFirstItem,
              isLastItem: item.isLastItem);
          break;
        case 2:
          return MyNormalCell(
              settingItem: item.objc,
              isFirstItem: item.isFirstItem,
              isLastItem: item.isLastItem);
          break;
        case 3:
          return Container(
            color: bgColor,
            height: 30,
          );
          break;
        default:
          return null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Consumer<AppStateModel>(builder: (context, model, child) {
        return CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              backgroundColor: bgColor,
              largeTitle: Text('Setting'),
            ),
            SliverSafeArea(
              // BEGINNING OF NEW CONTENT
              top: false,
              sliver: SliverList(
                delegate: _sliverChildBuilderDelegate(),
              ),
            ),
          ],
        );
      }),
    );
  }
}
