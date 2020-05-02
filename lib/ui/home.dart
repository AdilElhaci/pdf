import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:librarywithm/viewmodels/book_model.dart';


import 'package:librarywithm/viewmodels/user_model.dart';
import 'package:provider/provider.dart';
class Home extends StatelessWidget{



   Home({Key key}) : super(key: key);


  Widget build(BuildContext context) {
    final _userModel=Provider.of<UserModel>(context);



    return  Theme(
      data:ThemeData(
        primarySwatch: Colors.cyan,
      )
      ,child :new Scaffold(
      appBar: new AppBar(

        title: new Text("Home Page"),
        backgroundColor: Colors.lightBlue,
      ),
    body: Container(
      child: Text("Welcome ${_userModel.user.userName} ",style: TextStyle(color: Colors.black)),
    ),


    ),

    );
  }

}
