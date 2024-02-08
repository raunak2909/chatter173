

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:randomchat/models/user_model.dart';
import 'package:randomchat/screens/login.dart';

class FirebaseProvider{
  static final fireBaseAuth = FirebaseAuth.instance;
  static final fireBaseFireStore = FirebaseFirestore.instance;

  static final String COLLECTION_USER = "users";
  static final String COLLECTION_CHAT = "chats";

  static createUser({required UserModel mUser, required String mPass, required BuildContext context}) async {
    try {
      UserCredential credential = await fireBaseAuth.createUserWithEmailAndPassword
        (email: mUser.email!, password: mPass);

      /// create user in firestore
      if(credential.user!=null) {
        fireBaseFireStore
            .collection(COLLECTION_USER)
            .doc(credential.user!.uid)
            .set(mUser.toDoc()).then((value){
              Navigator.pop(context);
        }).onError((error, stackTrace) {
          print("Error: $error");
        });
      }


    } on FirebaseException catch (e){
      print("Error: $e");
    }
  }


  static authenticateUser({required mEmail, required String mPass, required BuildContext context}) async {
    try {
      UserCredential credential = await fireBaseAuth
          .signInWithEmailAndPassword(email: mEmail!, password: mPass);

      /// create user in firestore
      if(credential.user!=null) {
        ///store user prefs

      }


    } on FirebaseException catch (e){
      print("Error: $e");
    }
  }

}