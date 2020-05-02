

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:librarywithm/services/storage_base.dart';

class FireBaseStorageService implements StorageBase{
  final FirebaseStorage _firebaseStorage=FirebaseStorage.instance;
   StorageReference _storageReference;

  @override
  Future<String> uploadFile(String userId, String fileType, File file) async{
    _storageReference  =FirebaseStorage().ref().child(userId).child(fileType).child("profile_photo");
    var uploadTask =_storageReference.putFile(file);
    var url =await(await uploadTask.onComplete).ref.getDownloadURL();
    return url ;
  }


}