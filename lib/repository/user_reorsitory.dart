
import 'dart:io';

import 'package:librarywithm/model/user.dart';
import 'package:librarywithm/services/auth_base.dart';
import 'package:librarywithm/services/fake_auth_service.dart';
import 'package:librarywithm/services/firebase_auth_service.dart';
import 'package:librarywithm/services/firebase_storage_service.dart';
import 'package:librarywithm/services/firestore_db_service.dart';
import 'package:librarywithm/services/locator.dart';

enum AppMode { DEBUG, RELEASE }

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FakeAuthenticationService _fakeAuthenticationService =
  locator<FakeAuthenticationService>();
  FireStoreDBService _fireStoreDBService = locator<FireStoreDBService>();
  FireBaseStorageService _fireBaseStorageService = locator<FireBaseStorageService>();

  AppMode appMode = AppMode.RELEASE;

  @override
  Future<User> currentUser() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.currentUser();
    } else {
      User _user = await _firebaseAuthService.currentUser();
      return await _fireStoreDBService.readUser(_user.userId);
    }
  }

  @override
  Future<bool> signout() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signout();
    } else {
      return await _firebaseAuthService.signout();
    }
  }

  @override
  Future<User> createUserWithEmailAndPassword(
      String username, String password) async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.createUserWithEmailAndPassword(
          username, password);
    } else {
      User _user = await _firebaseAuthService.createUserWithEmailAndPassword(
          username, password);
      bool _result = await _fireStoreDBService.saveUser(_user);
      if (_result) {
        return await _fireStoreDBService.readUser(_user.userId);
      } else {
        return null;
      }
    }
  }

  @override
  Future<User> signInWithEmailAndPassword(
      String username, String password) async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signInWithEmailAndPassword(
          username, password);
    } else {
      User _user = await _firebaseAuthService.signInWithEmailAndPassword(
          username, password);
      return await _fireStoreDBService.readUser(_user.userId);
    }
  }

  Future <bool>updateUserName(String userId, String newName) async {
    if (appMode == AppMode.DEBUG) {
      return false;
    } else {

      return await _fireStoreDBService.updateUserName(userId,newName);
    }
  }

  Future<String>uploadFile(String userId, String fileType, File profilephoto)async {

    if (appMode == AppMode.DEBUG) {
      return "The download link";
    } else {
      var profilePhotoUrl=await _fireBaseStorageService.uploadFile(userId, fileType, profilephoto);
      _fireStoreDBService.updateProfilePhoto(profilePhotoUrl,userId);
      return profilePhotoUrl;
    }
  }
}
