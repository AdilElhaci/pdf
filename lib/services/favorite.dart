import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteService{

  Future<bool> deleteBook(String value)async{
    final Firestore _firebaseDB = Firestore.instance;
    var result =await _firebaseDB.collection("books").document("$value").delete();
    if(result = null){
      return true;
    }
    else{
      return false;
    }

    }



}