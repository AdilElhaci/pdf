import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:librarywithm/model/user.dart';
import 'package:librarywithm/services/auth_base.dart';
import 'package:librarywithm/services/firebase_auth_service.dart';
import 'package:librarywithm/services/locator.dart';
import 'package:librarywithm/viewmodels/user_model.dart';
import 'package:provider/provider.dart';
import 'forget_password.dart';
import 'create_account.dart';
import 'package:flutter/services.dart' show PlatformException;

class Login extends StatelessWidget {

  AuthBase authService = locator<FirebaseAuthService>();

  String userName, password;
  String message = "";
  bool otomatikcontrol = false;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          primaryColor: Colors.cyan,
        ),
        child: new Scaffold(
            backgroundColor: Colors.cyan[100],
            body: body(
              context,
            )));
  }

  Padding body(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    return Padding(
        padding: EdgeInsets.all(20),
        child: Form(
            key: formkey,
            autovalidate: otomatikcontrol,
            child: new ListView(children: <Widget>[
              new Padding(padding: new EdgeInsets.all(10)),
              new Container(
                  child: Image.asset(
                'images/logo.png',
                width: 100.0,
                height: 100.0,
              )),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  errorText: _userModel.passwordErrormessage,
                  prefix: Icon(Icons.person),
                  labelText: 'Name',
                  hintText: 'enter your name or email',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  userName = value;
                },
              ),
              SizedBox(height: 20.0),
              //Password
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  errorText: _userModel.passwordErrormessage,
                  border: OutlineInputBorder(),
                  filled: true,
                  prefix: Icon(Icons.lock),
                  hintText: 'Your password',
                  labelText: 'password',
                ),
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  password = value;
                },
              ),

              RaisedButton.icon(
                icon: Icon(Icons.arrow_forward),
                label: Text("Log in ",style: new TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.5),),
                disabledColor: Colors.blue[200],
                color: Colors.blue,
                onPressed: () => login(context),
              ),

              new Container(
                margin: const EdgeInsets.all(20),
                padding: EdgeInsets.only(left: 40),
                child: new InkWell(
                    child: new Text(
                      ("If you forget your password click here"),
                      style: new TextStyle(color: Colors.red, fontSize: 15.5),
                    ) //
                    ,
                    onTap: () => forgetPasswordPage(context)),
              ),

              new Container(
                  margin: const EdgeInsets.only(left: 15.0),
                  child: new RaisedButton(
                    onPressed: () {},
                    child: new Text(
                      ("Clear"),
                      style: new TextStyle(color: Colors.black, fontSize: 20.5),
                    ),
                    color: Colors.deepOrangeAccent,
                  )),
              new Padding(padding: new EdgeInsets.all(5)),
              new Container(
                  margin: const EdgeInsets.only(left: 15.0),
                  child: new RaisedButton(
                    onPressed: () => sininPage(context),
                    child: new Text(
                      ("Create account"),
                      style: new TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.5),
                    ),
                    color: Colors.blue[200],
                  )
              ),
            ]
            )));
  }

  bool validateAndSave() {
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      return true;
    } else
      return false;
  }

  void login(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context);
    User user;

    if (validateAndSave()) {
      formkey.currentState.save();
      try {
        user = await _userModel.signInWithEmailAndPassword(userName, password);
      } on PlatformException catch (e) {
        debugPrint("Widget Error Catched sign in " + e.toString());
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("the email or password is wrrong "),
                content: Text("s"),
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

  void sininPage(BuildContext context) async {
    Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true, builder: (context) => CreateAccount()));
  }

  void forgetPasswordPage(BuildContext context) async {
    Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true, builder: (context) => ForgetPassword()));
  }
}

