import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:librarywithm/model/user.dart';
import 'package:librarywithm/viewmodels/user_model.dart';
import 'package:provider/provider.dart';

class CreateAccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateAccountState();
  }
}

class CreateAccountState extends State<CreateAccount> {
  String  _email, _password, _rePass, message = " ";
  bool otomatikcontrol = false;
  final formkey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    final _userModel=Provider.of<UserModel>(context);
    if(_userModel.user!=null)
      {
        Navigator.of(context).pop();
      }
    return Theme(
      data: ThemeData(
        primaryColor: Colors.cyan,
      ),
      child: new Scaffold(
          appBar: AppBar(
            title: Text(
              "Create Account ",
            ),
          ),
          backgroundColor: Colors.white,
          body: body()),
    );
  }

  Padding body() {
    final _userModel=Provider.of<UserModel>(context);
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


            SizedBox(height: 8.0),

            // "Email" form.
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                prefix: Icon(Icons.email),
                hintText: 'Your email address',
                labelText: 'E-mail',
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (value)=>this._email = value
              ,
              validator: _validateEmail,
            ),

            SizedBox(height: 8.0),

            // "password" form.
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                prefix: Icon(Icons.lock),
                hintText: 'Your password',
                labelText: 'password',
              ),
              keyboardType: TextInputType.text,

              onSaved: (value)=>this._password=value
              ,
              validator: _validatePassword,
            ),
            SizedBox(height: 8.0),

            // "Rewrite password" form.
            TextFormField(
              obscureText: true,
              decoration:  InputDecoration(
                errorText:_userModel.stateMessage,
                border: OutlineInputBorder(),
                filled: true,
                prefix: Icon(Icons.lock),
                hintText: 'Your password',
                labelText: 'password',
              ),
              keyboardType: TextInputType.text,
              onSaved: (String value) {
                this._rePass = value;
              },
              validator: _validateRePassword,
            ),
            new Padding(padding: new EdgeInsets.all(10)),

            RaisedButton.icon(

              icon: Icon(Icons.save),
              label: Text("Register "),
              disabledColor: Colors.blue[200],
              color: Colors.blue,
              onPressed: confirmLoginInformation,
            ),
            Container(
                child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: Colors.green),
            )),
            //Register Form
          ]),
        ));
  }

  void confirmLoginInformation() async {
    final _userModel=Provider.of<UserModel>(context);
    User user;
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      try{
        user = await _userModel.createUserWithEmailAndPassword(this._email,this._password);
      }on PlatformException catch(e){
        print("Widget Error Catched sign in "+e.code);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("the email or password is wrrong "),
                content: Text(e.toString()),
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



  String _validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String _validateRePassword(String value) {
    if (this._rePass != this._password) {
      return "Rewrite your password correctly";
    } else
      return null;
  }

  String _validatePassword(String value) {
    if (value.isEmpty) return 'Name is required.';
    if (value.length < 6)
      return "Password must be more than 2 charater";
    else
      return null;
  }
}

