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
    apiKey: 'AIzaSyAThFoWYcdoTBU05KkcwhkIYz7QHcPV3EE',
    appId: '1:590495886385:web:1bd12c22a2287a041bf910',
    messagingSenderId: '590495886385',
    projectId: 'nina-homologacao-hcqesi',
    authDomain: 'nina-homologacao-hcqesi.firebaseapp.com',
    databaseURL: 'https://nina-homologacao-hcqesi.firebaseio.com',
    storageBucket: 'nina-homologacao-hcqesi.appspot.com',
    measurementId: 'G-JXY3BQ6DLC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAn8JbXUMoZcjY1hBFQNcr_3pHx0uIOji0',
    appId: '1:590495886385:android:a2739a07c798aad11bf910',
    messagingSenderId: '590495886385',
    projectId: 'nina-homologacao-hcqesi',
    databaseURL: 'https://nina-homologacao-hcqesi.firebaseio.com',
    storageBucket: 'nina-homologacao-hcqesi.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAWevPswpAhKQWSOg6fSBLnp68b0FyF6QI',
    appId: '1:590495886385:ios:5d803b6cca5c42101bf910',
    messagingSenderId: '590495886385',
    projectId: 'nina-homologacao-hcqesi',
    databaseURL: 'https://nina-homologacao-hcqesi.firebaseio.com',
    storageBucket: 'nina-homologacao-hcqesi.appspot.com',
    iosBundleId: 'com.example.appCrudNeotalk',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAWevPswpAhKQWSOg6fSBLnp68b0FyF6QI',
    appId: '1:590495886385:ios:90e82734520664201bf910',
    messagingSenderId: '590495886385',
    projectId: 'nina-homologacao-hcqesi',
    databaseURL: 'https://nina-homologacao-hcqesi.firebaseio.com',
    storageBucket: 'nina-homologacao-hcqesi.appspot.com',
    iosBundleId: 'com.example.appCrudNeotalk.RunnerTests',
  );
}
