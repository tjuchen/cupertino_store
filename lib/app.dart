import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:cupertinostore/model/app_state_model.dart';
import 'package:cupertinostore/tab_pages/my_tab.dart';
import 'package:cupertinostore/tab_pages/product_list_tab.dart';
import 'package:cupertinostore/tab_pages/search_tab.dart';
import 'package:cupertinostore/tab_pages/shopping_cart_tab.dart';
import 'theme/app_themes.dart';
import 'theme/bloc/theme_bloc.dart';
import 'other/utils.dart';

class CupertinoStoreApp extends StatelessWidget {
  Future initEngine() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    // initEngine();
    AppTheme appTheme = getCurrentTheme();
    return BlocProvider(
        create: (context) => ThemeBloc(appTheme),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: _buildWithTheme,
        ));
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return CupertinoApp(
      theme: appThemeDataMap[getCurrentTheme()],
      home: CupertinoStoreHomePage(),
    );
  }
}

class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), title: Text('Products')),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search), title: Text('Search')),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.shopping_cart), title: Text('Cart')),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person), title: Text('My')),
          ],
          activeColor: Colors.blueAccent,
          inactiveColor: Colors.grey,
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(child: ProductListTab());
                },
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(child: SearchTab());
                },
              );
              break;
            case 2:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(child: ShoppingCartTab());
                },
              );
              break;
            case 3:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(child: MyTab());
                },
              );
              break;
          }
        });
  }
}
