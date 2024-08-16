import 'package:app_crud_neotalk/Home/home_page.dart';
import 'package:app_crud_neotalk/services/authentication_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthenticationService.initializeService();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> initailization = Firebase.initializeApp();
    return FutureBuilder(
        future: initailization,
        builder: (context, snapshot) {
          //Something from Firebase
          if (snapshot.hasError) {
            if (kDebugMode) {
              print('Something Went Wrong');
            }
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: ' Neotalk',
              theme: ThemeData(
                primarySwatch: Colors.amber,
                appBarTheme: const AppBarTheme(
                  centerTitle: true,
                ),
              ),
              home: const HomePage(),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
