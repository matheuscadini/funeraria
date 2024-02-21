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
    apiKey: 'AIzaSyATt4XBKXgM-lzKN-aa1uoix6XMbz4cDb8',
    appId: '1:934331916847:web:45ff55a2159e398bec1cda',
    messagingSenderId: '934331916847',
    projectId: 'fir-funeraria',
    authDomain: 'fir-funeraria.firebaseapp.com',
    databaseURL: 'https://fir-funeraria-default-rtdb.firebaseio.com',
    storageBucket: 'fir-funeraria.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyALJOnTb19j0oEyGBGMOq849OAJ39ABNlI',
    appId: '1:934331916847:android:109225c5f8393f3bec1cda',
    messagingSenderId: '934331916847',
    projectId: 'fir-funeraria',
    databaseURL: 'https://fir-funeraria-default-rtdb.firebaseio.com',
    storageBucket: 'fir-funeraria.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCS3fU8a-K7csXxW646gAS5AFd3lR-CY5U',
    appId: '1:934331916847:ios:3c0a41f69cb7ae41ec1cda',
    messagingSenderId: '934331916847',
    projectId: 'fir-funeraria',
    databaseURL: 'https://fir-funeraria-default-rtdb.firebaseio.com',
    storageBucket: 'fir-funeraria.appspot.com',
    iosBundleId: 'com.example.flutterFuneraria',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCS3fU8a-K7csXxW646gAS5AFd3lR-CY5U',
    appId: '1:934331916847:ios:3c0a41f69cb7ae41ec1cda',
    messagingSenderId: '934331916847',
    projectId: 'fir-funeraria',
    databaseURL: 'https://fir-funeraria-default-rtdb.firebaseio.com',
    storageBucket: 'fir-funeraria.appspot.com',
    iosBundleId: 'com.example.flutterFuneraria',
  );
}