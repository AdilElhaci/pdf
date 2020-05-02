
import 'package:librarywithm/model/user.dart';
abstract class AuthBase{
  Future<User> currentUser();
  Future<bool>signout();
  Future<User>signInWithEmailAndPassword(String username,String password);
  Future<User>createUserWithEmailAndPassword(String username,String password);
}