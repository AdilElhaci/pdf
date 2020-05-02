import 'package:flutter/material.dart';
import 'package:librarywithm/ui/basic.dart';

import 'package:librarywithm/ui/sign_in.dart';
import 'package:librarywithm/viewmodels/user_model.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);

    if (_userModel.state == ViewState.idle) {
      if (_userModel.user == null) {
        return Login();
      } else {
        Future.delayed(Duration(milliseconds: 1), () {
          Navigator.of(context).popUntil(ModalRoute.withName("/"));
        });

        return Basic();
      }
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
