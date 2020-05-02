import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class User {
  final String userId;
  String email;
  String userName;
  String profilUrl;
  DateTime createdAt;
  DateTime updatedAt;
  String  favName;
  List<String> favoriteList;

  User({@required this.userId,@required this.email});

  Map<String, dynamic> toMap() {
    return {
    'userId':userId,
    'email':email,
    'name':userName ??  email.substring(0,email.indexOf("@"))+randomcreatenumber(),
    'profilUrl':profilUrl ?? 'https://im0-tub-com.yandex.net/i?id=5d66d4adefa2ad60851b2633457c3127&n=13',
    'createdAt':createdAt ?? FieldValue.serverTimestamp(),
    'updatedAt':updatedAt ?? FieldValue.serverTimestamp(),
     'favname' :favName ?? userName+"Favorite list",
      'favoriteList':favoriteList ?? null

  };
  }
  User.fromMap(Map<String,dynamic> map):
      userId=map['userId'],
      email=map['email'],
        userName=map['name'],
        profilUrl=map['email'],
        createdAt=(map['createdAt'] as Timestamp).toDate(),
        favName=map['favname'],
        updatedAt=(map['updatedAt']as Timestamp).toDate(),
        favoriteList=map['favoriteList'];

  @override
  String toString() {
    return 'User{userId: $userId, email: $email, userName: $userName, profilUrl: $profilUrl, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  String randomcreatenumber() {
    int randonNo=Random().nextInt(999);
    return randonNo.toString();
  }


}