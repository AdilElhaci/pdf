import 'package:librarywithm/model/category.dart';
import 'package:librarywithm/services/data_base_book.dart';
import 'package:librarywithm/services/fbasbook.dart';
import 'package:librarywithm/services/locator.dart';

class BookRepository implements DBBaseBook{
  FirebasAUBook _fireStoreAuBook = locator<FirebasAUBook>();
  @override
  Future<List<Category>> getAllCategories()async {
    var allcat=await _fireStoreAuBook.getAllCategories();
  return allcat;
  }

}