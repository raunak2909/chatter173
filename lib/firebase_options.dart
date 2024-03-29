// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAR45JAlVo2Wvz0UWIA6olAqvCtwcMFsGg',
    appId: '1:1027313617159:web:76c2f6af8b212927b31da2',
    messagingSenderId: '1027313617159',
    projectId: 'myfirebase173',
    authDomain: 'myfirebase173.firebaseapp.com',
    databaseURL: 'https://myfirebase173-default-rtdb.firebaseio.com',
    storageBucket: 'myfirebase173.appspot.com',
    measurementId: 'G-7YPM6DX80K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBdLC9_vu_fViFMfnfQ8hvQ3R6GtyKZMXs',
    appId: '1:1027313617159:android:d0d34df3af2bb482b31da2',
    messagingSenderId: '1027313617159',
    projectId: 'myfirebase173',
    databaseURL: 'https://myfirebase173-default-rtdb.firebaseio.com',
    storageBucket: 'myfirebase173.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDgDBGis3SqYLjkkdQcwdLry5dUIWvsOhY',
    appId: '1:1027313617159:ios:cd4cc44a96d852bfb31da2',
    messagingSenderId: '1027313617159',
    projectId: 'myfirebase173',
    databaseURL: 'https://myfirebase173-default-rtdb.firebaseio.com',
    storageBucket: 'myfirebase173.appspot.com',
    iosBundleId: 'com.example.randomchat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDgDBGis3SqYLjkkdQcwdLry5dUIWvsOhY',
    appId: '1:1027313617159:ios:06cdffaa9b5f2c26b31da2',
    messagingSenderId: '1027313617159',
    projectId: 'myfirebase173',
    databaseURL: 'https://myfirebase173-default-rtdb.firebaseio.com',
    storageBucket: 'myfirebase173.appspot.com',
    iosBundleId: 'com.example.randomchat.RunnerTests',
  );
}
