import 'package:app_crud_neotalk/services/app_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class AuthenticationService {
  static Future initializeService() async {
    if (kIsWeb) {
      await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: FirebaseConfig.apiKey,
              authDomain: FirebaseConfig.authDomain,
              projectId: FirebaseConfig.projectId,
              storageBucket: FirebaseConfig.storageBucket,
              messagingSenderId: FirebaseConfig.measurementId,
              appId: FirebaseConfig.appId,
              measurementId: FirebaseConfig.measurementId));
    }

    await Firebase.initializeApp();
  }
}
