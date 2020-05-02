import 'package:librarywithm/model/user.dart';

import 'auth_base.dart';

class FakeAuthenticationService implements AuthBase {
    String userId = "111";

  //uygulama içerisinde istenilen userId fake bir userid döndürme metodu
  @override
  Future<User> currentUser() async {
    return await Future.value(User(userId: userId, email: "fakeuser@fake.com"));
  }
  //kullanıcı çıkış botuna bastığında fake sign out metodu
  @override
  Future<bool> signout() {
    return Future.value(true);
  }
  //create sayfasında bir fake kullancı oluşturma metodu
  @override
  Future<User> createUserWithEmailAndPassword(
      String username, String password) async {
    return await Future.delayed(Duration(seconds: 2),
        () => User(userId: "Created user Id 1234", email: "fakeuser@fake.com"));
  }
  //sign in sayfasında fake bilgilerle giriş metodu
  @override
  Future<User> signInWithEmailAndPassword(
      String username, String password) async {
    return await Future.delayed(Duration(seconds: 2),
        () => User(userId: "Sign in user Id 1234", email: "fakeuser@fake.com"));
  }
}
