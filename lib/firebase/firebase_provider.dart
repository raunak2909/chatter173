import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:randomchat/models/message_model.dart';
import 'package:randomchat/models/user_model.dart';
import 'package:randomchat/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseProvider {
  static final fireBaseAuth = FirebaseAuth.instance;
  static final fireBaseFireStore = FirebaseFirestore.instance;

  static final String COLLECTION_USER = "users";
  static final String COLLECTION_CHAT = "chats";
  static final String COLLECTION_MSG = "messages";

  //static final userId = FirebaseAuth.instance.currentUser!.uid;

  Future<void> createUser(
      {required UserModel mUser, required String mPass}) async {
    try {
      UserCredential credential = await fireBaseAuth
          .createUserWithEmailAndPassword(email: mUser.email!, password: mPass);

      /// create user in firestore
      if (credential.user != null) {
        fireBaseFireStore
            .collection(COLLECTION_USER)
            .doc(credential.user!.uid)
            .set(mUser.toDoc())
            .then((value) {})
            .onError((error, stackTrace) {
          print("Error: $error");
          throw Exception("Error: $error");
        });
      }
    } on FirebaseException catch (e) {
      print("Error: $e");
      throw Exception("Error: $e");
    }
  }

  static authenticateUser(
      {required mEmail,
      required String mPass,
      required BuildContext context}) async {
    try {
      UserCredential credential = await fireBaseAuth.signInWithEmailAndPassword(
          email: mEmail!, password: mPass);

      /// create user in firestore
      if (credential.user != null) {
        ///store user prefs
      }
    } on FirebaseException catch (e) {
      print("Error: $e");
    }
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getAllUsers() {
    return fireBaseFireStore.collection(COLLECTION_USER).get();
  }

  static String getChatId(String fromId, String toId) {
    print("$fromId, $toId");
    if (fromId.hashCode <= toId.hashCode) {
      return "${fromId}_$toId";
    } else {
      return "${toId}_$fromId";
    }
  }

  static void sendMessage(
      {required String msg,
      required String toId,
      required String userId}) async {
    var currTime = DateTime.now().millisecondsSinceEpoch;
    var chatId = getChatId(userId, toId);
    print("$userId, $toId");
    print(chatId);

    var newMsg = MessageModel(
        msgId: currTime.toString(),
        msg: msg,
        sentAt: currTime.toString(),
        fromId: userId,
        toId: toId);

    fireBaseFireStore
        .collection(COLLECTION_CHAT)
        .doc(chatId)
        .collection(COLLECTION_MSG)
        .doc(currTime.toString())
        .set(newMsg.toDoc());
  }

  static void sendImageMsg(
      {required String imgUrl,
      required String toId,
      String imgMsg = "",
      required String userId}) async {
    var currTime = DateTime.now().millisecondsSinceEpoch;
    var chatId = getChatId(userId, toId);

    var newImgMsg = MessageModel(
        msgId: currTime.toString(),
        msg: imgMsg,
        sentAt: currTime.toString(),
        fromId: userId,
        msgType: 1,
        imgUrl: imgUrl,
        toId: toId);

    fireBaseFireStore
        .collection(COLLECTION_CHAT)
        .doc(chatId)
        .collection(COLLECTION_MSG)
        .doc(currTime.toString())
        .set(newImgMsg.toDoc());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMsg(
      {required String userId, required String toId}) {
    var chatId = getChatId(userId, toId);
    print("getMessage : $userId, $toId");
    print("getMessage : $chatId");

    return fireBaseFireStore
        .collection(COLLECTION_CHAT)
        .doc(chatId)
        .collection(COLLECTION_MSG)
        .orderBy("sentAt", descending: true)
        .snapshots();
  }

  static void updateReadStatus(
      {required String mId, required String userId, required String toId}) {
    var currTime = DateTime.now().millisecondsSinceEpoch;
    var chatId = getChatId(userId, toId);

    fireBaseFireStore
        .collection(COLLECTION_CHAT)
        .doc(chatId)
        .collection(COLLECTION_MSG)
        .doc(mId)
        .update({"readAt": currTime.toString()});
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getUnreadCount(
      {required String userId, required String toId}) {
    var chatId = getChatId(userId, toId);

    return fireBaseFireStore
        .collection(COLLECTION_CHAT)
        .doc(chatId)
        .collection(COLLECTION_MSG)
        .where("readAt", isEqualTo: "")
        .where("fromId", isEqualTo: toId)
        .snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getLastMsg({required String userId, required String toId}){
    var chatId = getChatId(userId, toId);

    return fireBaseFireStore
        .collection(COLLECTION_CHAT)
        .doc(chatId)
        .collection(COLLECTION_MSG)
        .orderBy("sentAt", descending: true)
        .limit(1)
        .snapshots();


  }


}
