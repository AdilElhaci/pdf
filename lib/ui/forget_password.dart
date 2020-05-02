import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ForgetState();
  }
}

class ForgetState extends State<ForgetPassword> {

  final FirebaseAuth _aut = FirebaseAuth.instance;
  String _email,message=" ";
  final formkey = GlobalKey<FormState>();
  bool otomatikcontrol = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          primaryColor: Colors.cyan,
        ),
        child: new Scaffold(
          appBar: AppBar(
            title: Text(
              "Forget password",
            ),
          ),
          backgroundColor: Colors.teal[100],
          body: Padding(
              padding: EdgeInsets.all(10),
              child: Form(
                key: formkey,
                autovalidate: otomatikcontrol,
                child: new ListView(children: <Widget>[
                  new Padding(padding: new EdgeInsets.all(10)),
                  new Image.asset(
                    'images/logo.png',
                    width: 125.0,
                    height: 125.0,
                  ),
                  SizedBox(height: 24.0),

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
                    onSaved: (String value) {
                      this._email = value;
                    },
                    validator: _validateEmail,
                  ),
                  SizedBox(height: 10.0),
                  RaisedButton.icon(
                    label: Text("Send"),
                    icon: Icon(Icons.arrow_forward),
                    disabledColor: Colors.blue[50],
                    color: Colors.blue,
                    onPressed: sendEmail,
                  ),Container(
                      child: Text(
                        message,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0, color: Colors.green),
                      )),
                ]),
              )),
        ));
  }

  void sendEmail() {
    if (formkey.currentState.validate()) {
      formkey.currentState.save();

      _aut.sendPasswordResetEmail(email: this._email).then((onValue){
        setState(() {
          message="The reseting email has been sent for your email";
        });
      }
      ).catchError((onError){
        setState(() {
          message="${"Your email is not exist"}";
        });
      });

    } else {
      setState(() {
        otomatikcontrol = true;
      });
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
}
