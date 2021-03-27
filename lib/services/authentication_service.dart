import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:schooler/models/user.dart';

import '../locator.dart';
import 'firestore_service.dart';


class AuthenticationService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FireStoreService _fireStoreService = locator<FireStoreService>();

  // Note: Custom User, not FireBase User.
  UserModel _currentUser;
  UserModel get currentUser => _currentUser;

  Future _populateUser(User user) async {
    if(user != null){
      _currentUser = await _fireStoreService.getUser(user.uid);
    }
  }

  Future loginWithEmail(String email, String password) async {
    try {
      var result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      await _populateUser(result.user);
      return result.user != null;
    } catch(e){
      return e.message;
    }
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
     await _fireStoreService.createUser(UserModel(
       userID: authResult.user.uid,
       email: email,
       fullName: null
     ));
      return authResult.user != null;
    } catch(e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    try {
      var user = _firebaseAuth.currentUser;
      await _fireStoreService.getUser(user.uid);
      return user != null;
    } catch(e){
      return false;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

}