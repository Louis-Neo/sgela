
import 'package:flutter/foundation.dart';

class Post {

  final String title;
  final String userID;
  final String imageUrl;
  final String documentID;

  Post({
    @required this.title,
    this.documentID,
    @required this.userID,
    this.imageUrl
  });

  Map<String, dynamic> toJson(){
    return {
      'userID': userID,
      'title': title,
      'imageUrl': imageUrl
    };
  }

  static Post fromJson(Map<String, dynamic> data, String documentID){
    if(data == null) return null;

    return Post(
      userID: data['userID'],
      title: data['title'],
      imageUrl: data['imageUrl'],
      documentID: documentID
    );
  }

}