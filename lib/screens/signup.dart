
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:randomchat/firebase/firebase_provider.dart';
import 'package:randomchat/models/user_model.dart';
import 'package:randomchat/screens/login.dart';
import 'package:randomchat/screens/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final mFormKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUpPage"),
      ),
      body: Form(
        key: mFormKey,
        child: Center(child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("SignUp To Create Account!", style: TextStyle(fontSize: 22),),
              const SizedBox(height: 19,),
              myTextField(
                validator: (value){

                  const pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                  final regExp = RegExp(pattern);

                  if(value!.isEmpty){
                   return "Email can't be empty!";
                 } else if(!regExp.hasMatch(value)){
                    return "Please enter a valid email!";
                 }
                },
                mcrontroller: emailController,
                hinttxt: "Enter Your email",
                labelTxt: "Email",
                preIcon: const Icon(Icons.email),
              ),
              const SizedBox(height: 12,),
              myTextField(
                validator: (value){
                  if(value!.length<=7){
                    return "Length should be greater than 7";
                  }
                },
                mcrontroller: passController,
                hinttxt: "Enter Your password",
                labelTxt: "password",
                preIcon: const Icon(Icons.remove_red_eye),
              ),
              const SizedBox(height: 12,),
              ElevatedButton(onPressed: () async {

                /// firebase sign Up

               if(mFormKey.currentState!.validate()){
                 String email = emailController.text;
                 String password = passController.text;


                 if(emailController.text.isNotEmpty && passController.text.isNotEmpty){

                   var newUser = UserModel(name: "name", email: email, mobNo: "9876543321", gender: "Male", isOnline: false, status: 1, profilePic: "", profileStatus: 1);
                   FirebaseProvider.createUser(mUser: newUser, mPass: password, context: context);

                 } /// if
               }

              }, child: const Text("SignUp Now!")),
              SizedBox(height: 25,),
              TextButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage(),));

              }, child: Text("Go Login Page")),
            ],
          ),
        )),
      ),
    );
  }
}