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
    apiKey: 'AIzaSyAmE8fQ-fP8-NVdF8oT86RldstYjoGpwMo',
    appId: '1:699684571113:web:8ee9d809143919ae70ed78',
    messagingSenderId: '699684571113',
    projectId: 'journalism-student-coverage',
    authDomain: 'journalism-student-coverage.firebaseapp.com',
    databaseURL: 'https://journalism-student-coverage-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'journalism-student-coverage.appspot.com',
    measurementId: 'G-PB88WHRYGB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAiM4TP7XJRW8QYO2c08aPTXXntNTUIRFY',
    appId: '1:699684571113:android:67bb614be58bf61570ed78',
    messagingSenderId: '699684571113',
    projectId: 'journalism-student-coverage',
    databaseURL: 'https://journalism-student-coverage-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'journalism-student-coverage.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBL8CyROKJ3HyGoWDQJCWQA09Zi4c7FoAQ',
    appId: '1:699684571113:ios:7803b5962bc5eda570ed78',
    messagingSenderId: '699684571113',
    projectId: 'journalism-student-coverage',
    databaseURL: 'https://journalism-student-coverage-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'journalism-student-coverage.appspot.com',
    iosClientId: '699684571113-6ehtef9jse7dd73dnf6si2a80f69r7o6.apps.googleusercontent.com',
    iosBundleId: 'com.example.ybassisstant',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBL8CyROKJ3HyGoWDQJCWQA09Zi4c7FoAQ',
    appId: '1:699684571113:ios:7803b5962bc5eda570ed78',
    messagingSenderId: '699684571113',
    projectId: 'journalism-student-coverage',
    databaseURL: 'https://journalism-student-coverage-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'journalism-student-coverage.appspot.com',
    iosClientId: '699684571113-6ehtef9jse7dd73dnf6si2a80f69r7o6.apps.googleusercontent.com',
    iosBundleId: 'com.example.ybassisstant',
  );
}