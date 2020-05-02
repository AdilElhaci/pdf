import 'dart:io';
import 'package:flutter/material.dart';
import 'package:librarywithm/model/user.dart';
import 'package:librarywithm/repository/user_reorsitory.dart';
import 'package:librarywithm/services/auth_base.dart';
import 'package:librarywithm/services/locator.dart';

enum ViewState { idle, Busy }

class UserModel with ChangeNotifier implements AuthBase {
  ViewState _state = ViewState.idle;

  UserRepository _userRepository = locator<UserRepository>();
  String stateMessage;
  String emailErrormessage;

  String passwordErrormessage;
  User _user;

  User get user => _user;

  UserModel() {
    currentUser();
  }

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  @override
  Future<User> currentUser() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.currentUser();

      return _user;
    } catch (e) {
      debugPrint("Ther is on Error in View Model :" + e.toString());
      return null;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<bool> signout() async {
    try {
      state = ViewState.Busy;
      bool result = await _userRepository.signout();
      _user = null;
      return result;
    } catch (e) {
      debugPrint("Ther is on Error in View Model :" + e.toString());
      return false;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<User> createUserWithEmailAndPassword(
      String username, String password) async {
    if (_emailPasswordControl(username, password)) {
      try {
        state = ViewState.Busy;
        _user = await _userRepository.createUserWithEmailAndPassword(
            username, password);

        return _user;
      } finally {
        state = ViewState.idle;
      }
    } else {
      return null;
    }
  }

  @override
  Future<User> signInWithEmailAndPassword(
      String username, String password) async {
    try {
      if (_emailPasswordControl(username, password)) {
        state = ViewState.Busy;
        _user = await _userRepository.signInWithEmailAndPassword(
            username, password);
        return _user;
      } else {
        return null;
      }
    } finally {
      state = ViewState.idle;
    }
  }

  bool _emailPasswordControl(String email, String password) {
    var result = true;

    if (password.length < 6) {
      passwordErrormessage = "You must enter minimum 6 characters ";
      result = false;
    } else {
      passwordErrormessage = null;
    }

    if ((!email.contains("@"))) {
      emailErrormessage = "invalid email value";
      result = false;
    } else {
      emailErrormessage = null;
    }

    return result;
  }

  void callMessage() async {
    await Future.delayed(Duration(seconds: 4), () {
      if (_user.userId != null)
        stateMessage = "you have been register Successfully";
      else
        stateMessage = "unsuccessful login";
    });
  }

  Future<bool> updateUserName(String userId, String newName) async {
    var result = await _userRepository.updateUserName(userId, newName);
    if (result == true) {
      _user.userName = newName;
    }

    return result;
  }

  Future<String>uploadFile(String userId, String fileType, File profilephoto) async{
    var downloadLink = await _userRepository.uploadFile(userId, fileType,profilephoto);
    return downloadLink;
  }
}
