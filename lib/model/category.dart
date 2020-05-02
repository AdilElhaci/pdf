class Category{
String catId;
String name;


Map<String, dynamic> toMap() {
  return {
    'catId':catId,
    'name':name,


  };
}

Category.fromMap(Map<String,dynamic> map):
      catId=map['category_id'],
      name=map['name'];




@override
String toString() {
  return 'Category{catId: $catId, name: $name}';
}


}