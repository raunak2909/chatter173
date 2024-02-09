import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:randomchat/firebase/firebase_provider.dart';
import 'package:randomchat/models/user_model.dart';
import 'package:randomchat/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  var userId;
  @override
  void initState() {
    super.initState();

  }

  Future<void> getUserId() async {
    var prefs = await SharedPreferences.getInstance();
    userId = prefs.getString(LoginPageState.LOGIN_PREFS_KEY);
  }

  @override
  Widget build(BuildContext context) {
    getUserId();
    return Scaffold(
      appBar: AppBar(
        title: Text('All Contacts'),
      ),
      body: FutureBuilder(
        future: FirebaseProvider.getAllUsers(),
        builder: (_ , snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return CircularProgressIndicator();
          }

          List<UserModel> arrUsers = [];


          for(QueryDocumentSnapshot<Map<String, dynamic>> eachDoc in snapshot.data!.docs){
            var eachUser = UserModel.fromDoc(eachDoc.data());
            if(eachDoc.id!=userId){
              arrUsers.add(eachUser);
            }
          }

          return snapshot.data!.docs.isNotEmpty ?
          ListView.builder(
            itemCount: arrUsers.length,
              itemBuilder: (_,index){
            return ListTile(
              onTap: (){

              },
                leading: CircleAvatar(
                  child: arrUsers[index].profilePic!="" ? Image.network(arrUsers[index].profilePic!) : Icon(Icons.account_circle),
                ),
                title: Text(arrUsers[index].name!),
                subtitle: Text(arrUsers[index].email!),);
          }) : Center(
            child: Text('No Users Found'),
          );
        },
      ),
    );
  }
}
