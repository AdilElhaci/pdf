import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:librarywithm/ui/sign_in.dart';
import 'package:librarywithm/viewmodels/user_model.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Settings> {
  TextEditingController _controllerUserName;

  @override
  void initState() {
    super.initState();
    _controllerUserName = TextEditingController();
  }

  @override
  void dispose() {
    _controllerUserName.dispose();
    super.dispose();
  }

  File _profilephoto;

  void _fromGalery() async {
    var _newphoto = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      Navigator.of(context).pop();
      _profilephoto = _newphoto;
    });
  }

  void _takefromcam() async {
    var _newphoto = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      Navigator.of(context).pop();
      _profilephoto = _newphoto;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserModel _userModel = Provider.of<UserModel>(context);
    _controllerUserName.text = _userModel.user.userName;
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      child: new Scaffold(
        appBar: new AppBar(
          title: Text("Settings"),
          actions: <Widget>[
            FlatButton(
              onPressed: () => signout(context),
              child: Text(
                "Log out",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
          backgroundColor: Colors.lightBlue,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 180,
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.camera),
                                    title: Text("Take a photo from camera"),
                                    onTap: () {
                                      _takefromcam();
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.image),
                                    title: Text("add a picture from galery"),
                                    onTap: () {
                                      _fromGalery();
                                    },
                                  )
                                ],
                              ),
                            );
                          });
                    },
                    child: CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.white,
                      backgroundImage: _profilephoto == null
                          ? NetworkImage(_userModel.user.profilUrl)
                          : FileImage(_profilephoto),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    initialValue: _userModel.user.email,
                    readOnly: true,
                    decoration: InputDecoration(
                        labelText: "Your eamil",
                        hintText: "Email",
                        border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controllerUserName,
                    decoration: InputDecoration(
                        labelText: "Your Name",
                        hintText: "Name",
                        border: OutlineInputBorder()),
                  ),
                ),
                new Container(
                    child: SizedBox(
                        height: 40,
                        child: RaisedButton(
                            onPressed: () {
                              _updateUserName(context);
                              _profilePhotoUpload(context);
                            },
                            child: new Text(
                              ("Save"),
                              style: new TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.5),
                            ),
                            color: Colors.blue[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            )))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> signout(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context);
    bool result = await _userModel.signout();

    if (result == true) {
      Navigator.of(context).push(MaterialPageRoute(
          fullscreenDialog: true, builder: (context) => Login()));
    }
    return result;
  }

  void _updateUserName(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context);
    if (_userModel.user.userName != _controllerUserName.text) {
      var updateResult = await _userModel.updateUserName(
          _userModel.user.userId, _controllerUserName.text);
      if (updateResult == true) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("successfully"),
                content: Text("Your user name have been updated"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      } else {
        _controllerUserName.text = _userModel.user.userName;
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text(
                    "The user name you entered is in used try defferent value"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      }
    }
  }

  void _profilePhotoUpload(BuildContext context) async{
    final _userModel = Provider.of<UserModel>(context);
    if(_profilephoto!=null){
     var url= await  _userModel.uploadFile(_userModel.user.userId,"profilePhoto",_profilephoto);
    }


  }
}
