import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:randomchat/firebase_options.dart';
import 'package:randomchat/screens/home_screen.dart';
import 'package:randomchat/screens/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}


