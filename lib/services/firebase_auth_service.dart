import 'package:librarywithm/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_base.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User> currentUser() async {
    try {
      FirebaseUser user = await _firebaseAuth.currentUser();
      return _userFromFirebase(user);
    } catch (e) {
      print("Error in Current User :" + e.toString());
      return null;
    }
  }

  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    } else {
      return User(userId: user.uid, email: user.email);
    }
  }

  @override
  Future<bool> signout() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print("Error in Signout :" + e.toString());
      return false;
    }
  }

  @override
  Future<User> createUserWithEmailAndPassword(
      String username, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: username, password: password);
    result.user.sendEmailVerification();
    return _userFromFirebase(result.user);
  }

  @override
  Future<User> signInWithEmailAndPassword(
      String username, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: username, password: password);
    return _userFromFirebase(result.user);
  }
}
