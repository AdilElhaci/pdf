import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TabItem {home,search,favorite,settings,profile}
class TabItemData{
  final String title;
  final IconData icon;

  TabItemData(this.title, this.icon);
  static Map<TabItem,TabItemData> allTabs={
    TabItem.home: TabItemData("Home",Icons.home),
    TabItem.profile:TabItemData("Profile",Icons.person),
    TabItem.search:TabItemData("Search",Icons.search),
    TabItem.favorite:TabItemData("Favorite",Icons.favorite),
    TabItem.settings:TabItemData("Settings",Icons.settings),


  };


}