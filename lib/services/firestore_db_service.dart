import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:librarywithm/model/category.dart';
import 'package:librarywithm/model/user.dart';
import 'package:librarywithm/services/databaseuser.dart';

class FireStoreDBService implements DBBaseUser {
  final Firestore _firebaseDB = Firestore.instance;

  @override
  Future<bool> saveUser(User user) async {
    await _firebaseDB
        .collection("users")
        .document(user.userId)
        .setData(user.toMap());

    DocumentSnapshot _read =
        await Firestore.instance.document("users/${user.userId}/").get();

    Map _readMap = _read.data;

    User _readuserinfo = User.fromMap(_readMap);
    print("User information : " + _readuserinfo.toString());

    return true;
  }

  @override
  Future<User> readUser(String userId) async {
    DocumentSnapshot readUser =
        await _firebaseDB.collection("users").document(userId).get();
    Map<String, dynamic> readUserMaInfo = readUser.data;
    User objectUser = User.fromMap(readUserMaInfo);
    print("${objectUser.toString()}");
    return objectUser;
  }

  @override
  Future<bool> updateUserName(String userId, String newName) async {
    var users = await _firebaseDB
        .collection("users")
        .where("name", isEqualTo: newName)
        .getDocuments();
    if (users.documents.length >= 1) {
      return false;
    } else {
      await _firebaseDB
          .collection("users")
          .document(userId)
          .updateData({'name': newName});
      return true;
    }
  }

  @override
  Future<bool> updateProfilePhoto(String profilePhotoUrl, String userId) async {
    await _firebaseDB
        .collection("users")
        .document(userId)
        .updateData({'profilUrl': profilePhotoUrl});
    return true;
  }

  @override
  Future<List<Category>> getAllBooks() async{
   QuerySnapshot querySnapshot= await _firebaseDB.collection("category").getDocuments();

   for(DocumentSnapshot cat in querySnapshot.documents){
     
   }
  }




}
