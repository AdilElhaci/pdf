class Book{


String bookId;
String name;
int likes;
int pageNumber;
String comments;
Map<String, dynamic> toMap() {
  return {
    'bookId': bookId,
    'name': name,
    'likes': likes,
    'pageNumber': pageNumber,
    'comments': comments
  };
}

Book.fromMap(Map<String,dynamic> map):
      bookId=map['bookId'],
      name=map['name'],
      likes=map['likes'],
      pageNumber=map['pageNumber'],
      comments=map['comments'];

}