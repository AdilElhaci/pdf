import 'package:flutter/material.dart';
class FavoriteBooks extends StatefulWidget {
  @override
  _FavoriteBooksState createState() => _FavoriteBooksState();
}

class _FavoriteBooksState extends State<FavoriteBooks> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data:ThemeData(
        primarySwatch: Colors.cyan,
      )
      ,child :new Scaffold(

      appBar: new AppBar(
        title: new Text("Favorite Books"),

        backgroundColor: Colors.lightBlue,
      ),
      body : Padding(
        padding: EdgeInsets.all(20),

        child: new ListView(

        ),

    )


    ),

    );
  }
}
