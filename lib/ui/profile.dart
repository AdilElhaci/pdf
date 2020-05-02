import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:librarywithm/viewmodels/user_model.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    UserModel _userModel=Provider.of<UserModel>(context);
    print("${_userModel.user.profilUrl}");
    return Theme(
        data: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        child: new Scaffold(
            appBar: new AppBar(
              title: new Text(
                "Profile",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.grey,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipOval(
                                child: Image.asset(
                              'images/w.jpg',
                              //fit: BoxFit.contain,
                              matchTextDirection: true,
                              height: 100, width: 100,
                            ))),
                      ) //Icon
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: <Widget>[
                      Align(
                        //  alignment: Alignment.centerLeft,
                        child: Container(
                          margin: new EdgeInsets.only(left: 10),
                          child: Column(
                            children: <Widget>[
                              Align(
                                child: Text(
                                  "Name ",
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 20.0),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Align(
                        //  alignment: Alignment.centerLeft,
                        child: Container(
                          margin: new EdgeInsets.only(left: 10),
                          child: Column(
                            children: <Widget>[
                              Align(
                                child: Text(
                                  "Adil Elhaci",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: <Widget>[
                      Align(
                        //  alignment: Alignment.centerLeft,
                        child: Container(
                          margin: new EdgeInsets.only(left: 10),
                          child: Column(
                            children: <Widget>[
                              Align(
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 20.0),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Align(
                        //  alignment: Alignment.centerLeft,
                        child: Container(
                          margin: new EdgeInsets.only(left: 10),
                          child: Column(
                            children: <Widget>[
                              Align(
                                child: Text(
                                  "adelalhajji97@gmail.com",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Align(
                        //  alignment: Alignment.centerLeft,
                        child: Container(
                          margin: new EdgeInsets.only(left: 10),
                          child: Column(
                            children: <Widget>[
                              Align(
                                child: Text(
                                  "Description",
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 20.0),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Align(
                        //  alignment: Alignment.centerLeft,
                        child: Container(
                          margin: new EdgeInsets.only(left: 10),
                          child: Column(
                            children: <Widget>[
                              Align(
                                child: Text(
                                  "İÜ Computer Engineering",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: <Widget>[
                              Column(children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 50),
                                  child: Text(
                                    "Liks Number",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 25),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  margin: new EdgeInsets.only(right: 10),
                                  child: Text(
                                    "20",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ),
                              ]),
                              Column(children: <Widget>[
                                Container(
                                  margin: new EdgeInsets.only(left: 50),
                                  child: Text(
                                    "Command",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 25),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  margin: new EdgeInsets.only(left: 50),
                                  child: Text(
                                    "20",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ),
                              ])
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }


}
