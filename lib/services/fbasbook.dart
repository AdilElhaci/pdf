import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:librarywithm/model/book.dart';
import 'package:librarywithm/model/category.dart';
import 'package:librarywithm/services/data_base_book.dart';

class FirebasAUBook implements DBBaseBook{


  final Firestore _firebaseDB = Firestore.instance;

  @override
  Future<List<Category>> getAllCategories() async{
    QuerySnapshot querySnapshot= await _firebaseDB.collection("category").getDocuments();
    List<Category> catList=[];
    for(DocumentSnapshot cat in querySnapshot.documents){
      Category tmp=Category.fromMap(cat.data);
      catList.add(tmp);
    }

  }


  @override
  Future<List<Book>> getAllBooks() async{
    QuerySnapshot querySnapshot= await _firebaseDB.collection("books").getDocuments();
    List<Book> catList=[];
    for(DocumentSnapshot cat in querySnapshot.documents)
    {
      Book tmp=Book.fromMap(cat.data);
      catList.add(tmp);
    }

  }





}