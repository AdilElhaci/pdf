import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:librarywithm/ui/tab_items.dart';

class MyCustomBottomNaviation extends StatelessWidget {
  const MyCustomBottomNaviation(
      {Key key, @required this.currentTab, @required this.onSelectedTab,
        @required this.pageCreater,@required this.navigatorKeys})
      : super(key: key);

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectedTab;
  final Map<TabItem, Widget> pageCreater;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(tabBar: CupertinoTabBar(
      items: [
        _navItemCreate(TabItem.home),
        _navItemCreate(TabItem.search),
        _navItemCreate(TabItem.favorite),
        _navItemCreate(TabItem.settings),
        _navItemCreate(TabItem.profile),

      ],
      onTap: (index) => onSelectedTab(TabItem.values[index]),
    ),
      tabBuilder: (context, index) {
        final willShownItem = TabItem.values[index];

        return CupertinoTabView(
        navigatorKey: navigatorKeys[willShownItem],
        builder: (context){
        return pageCreater[willShownItem];
        });
      },
    );
  }


  BottomNavigationBarItem _navItemCreate(TabItem tabItem) {
    final willcreate = TabItemData.allTabs[tabItem];
    return BottomNavigationBarItem(
      icon: Icon(willcreate.icon),
      title: Text(willcreate.title),
    );
  }
}
