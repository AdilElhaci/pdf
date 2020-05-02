import 'package:flutter/cupertino.dart';

import 'package:librarywithm/model/category.dart';


import 'package:librarywithm/repository/book_reprsitoory.dart';


import 'package:librarywithm/services/data_base_book.dart';


import 'package:librarywithm/services/locator.dart';

class BookModel with ChangeNotifier implements DBBaseBook{
  BookRepository _bookRepository = locator<BookRepository>();
  @override
  Future<List<Category>> getAllCategories() async{

    var allCategories=await _bookRepository.getAllCategories();

  }

}