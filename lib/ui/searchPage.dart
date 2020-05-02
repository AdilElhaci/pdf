import 'package:flutter/material.dart';


class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return  Theme(
      data:ThemeData(
        primarySwatch: Colors.cyan,
      )
      ,child :new Scaffold(

      appBar: new AppBar(
        title: new Text("Search"),

        backgroundColor: Colors.lightBlue,
      ),
    ),

    );
  }
}
