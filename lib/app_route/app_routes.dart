
import 'package:flutter/material.dart';
import 'package:randomchat/screens/chat_screen.dart';
import 'package:randomchat/screens/contact_page.dart';
import 'package:randomchat/screens/home_screen.dart';
import 'package:randomchat/screens/login.dart';
import 'package:randomchat/screens/signup.dart';
import 'package:randomchat/screens/splash.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String homeScreen = '/home_screen';

  static const String contactScreen = '/contact_screen';

  static const String chatScreen = '/chat_screen';



  static Map<String, WidgetBuilder> get routes => {
        splashScreen : (context) => SplashPage(),
         loginScreen : (context) => LoginPage(),
         signUpScreen : (context) => SignUpPage.builder(),
         homeScreen : (context) => HomeScreen(),
         contactScreen : (context) => ContactPage(),
         chatScreen : (context) => ChatScreen(),
      };
}
