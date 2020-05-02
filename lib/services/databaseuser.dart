import 'package:librarywithm/model/book.dart';
import 'package:librarywithm/model/category.dart';
import 'package:librarywithm/model/user.dart';

abstract class DBBaseUser{
  Future<bool>saveUser(User user);
  Future<User>readUser(String userId);
  Future<bool>updateUserName(String userId,String newName);
}