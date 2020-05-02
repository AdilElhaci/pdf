import 'package:flutter/material.dart';

import 'package:librarywithm/ui/favorite_books.dart';
import 'package:librarywithm/ui/my_custom_bottom_navi.dart';
import 'package:librarywithm/ui/profile.dart';
import 'package:librarywithm/ui/searchPage.dart';
import 'package:librarywithm/ui/settings.dart';
import 'package:librarywithm/ui/tab_items.dart';
import 'home.dart';

class Basic extends StatefulWidget {


  Basic({ Key key}) : super(key: key);

  @override
  _BasicState createState() => _BasicState();
}

class _BasicState extends State<Basic> {
  TabItem _currentTab = TabItem.home;

  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
    TabItem.search: GlobalKey<NavigatorState>(),
    TabItem.favorite: GlobalKey<NavigatorState>(),
    TabItem.settings: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, Widget> allPages() {
    return {
      TabItem.home: Home(),
      TabItem.profile: Profile(),
      TabItem.settings: Settings(),
      TabItem.favorite: FavoriteBooks(),
      TabItem.search: SearchPage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[_currentTab].currentState.maybePop(),
      //bir once ki sayfa geri döebiliyor muyuz ? için
      child: MyCustomBottomNaviation(
        pageCreater: allPages(),
        navigatorKeys: navigatorKeys,
        currentTab: _currentTab,
        onSelectedTab: (selectedTab) {
          if (selectedTab == _currentTab) {
            navigatorKeys[selectedTab]
                .currentState
                .pop((route) => route.isFirst);
          } else {
            setState(() {
              _currentTab = selectedTab;
            });
          }
        },
      ),
    );
  }
}
