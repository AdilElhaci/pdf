import 'package:get_it/get_it.dart';
import 'package:librarywithm/repository/book_reprsitoory.dart';
import 'package:librarywithm/repository/user_reorsitory.dart';
import 'package:librarywithm/services/fake_auth_service.dart';
import 'package:librarywithm/services/fbasbook.dart';
import 'package:librarywithm/services/firebase_auth_service.dart';
import 'package:librarywithm/services/firebase_storage_service.dart';
import 'package:librarywithm/services/firestore_db_service.dart';

  GetIt locator = GetIt();

void setupLocator(){
locator.registerLazySingleton(()=>FirebaseAuthService());
locator.registerLazySingleton(()=>FakeAuthenticationService());
locator.registerLazySingleton(()=>FireStoreDBService());
locator.registerLazySingleton(()=>UserRepository());
locator.registerLazySingleton(()=>FireBaseStorageService());
locator.registerLazySingleton(()=>BookRepository());
locator.registerLazySingleton(()=>FirebasAUBook());



}