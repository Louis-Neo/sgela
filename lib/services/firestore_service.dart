import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:schooler/models/create_post.dart';
import 'package:schooler/models/user.dart';

class FireStoreService {

  final CollectionReference _userCollectionReference = FirebaseFirestore.instance.collection('users');
  final CollectionReference _postsCollectionReference = FirebaseFirestore.instance.collection('posts');

  final StreamController<List<Post>> _postsController = StreamController<List<Post>>.broadcast();

  Future createUser(UserModel user) async {
    try {
      await _userCollectionReference.doc(user.userID).set(user.toJson());
    } catch(e){
      return e.message;
    }
  }

  Future getUser(String userID) async {
    try {
      var userData = await _userCollectionReference.doc(userID).get();
      return UserModel.fromJson(userData.data());
    } catch(e){
      return e.message;
    }
  }

  // Adding a post on the main feed
  Future addPost(Post post) async {
    try {
      await _postsCollectionReference.add(post.toJson());
      return true;
    } catch(e) {
      return e.toString();
    }
  }

  // Once off Posts Document read
  Future getPostsOnceOff() async {
    try {
      var postDocuments = await _postsCollectionReference.get();
      if(postDocuments.docs.isNotEmpty){
        return postDocuments.docs.map((snapshot) => Post.fromJson(snapshot.data(), snapshot.id))
            .where((mappedItem) => mappedItem.title != null)
            .toList();
      }
    } catch(e) {
      if(e is PlatformException){
        return e.message;
      }
      return e.toString();
    }
  }

  // Stream of Posts
  Stream realtimePostUpdates(){
    _postsCollectionReference.snapshots().listen((postsSnapShot) {
      if(postsSnapShot.docs.isNotEmpty){
        var posts = postsSnapShot.docs
            .map((snapshot) => Post.fromJson(snapshot.data(), snapshot.id))
            .where((mappedItem) => mappedItem.title != null)
            .toList();
        _postsController.add(posts);
      }
    });
    return _postsController.stream;
  }

  Future deletePost(String documentID) async {
    await _postsCollectionReference.doc(documentID).delete();
  }

  Future updatePost(Post post) async {

    try {
      await _postsCollectionReference
            .doc(post.documentID)
            .update(post.toJson());
      return true;
    } catch(e) {
      if(e is PlatformException){
        return e.message;
      }

      return e.toString();
    }

  }

}