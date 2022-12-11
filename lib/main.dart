import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:central_de_eventos/screens/splash_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
  // });
  // firebaseMessaging.configure(
  //   onMessage: (Map<String, dynamic> message) async {
  //     print("onMessage: $message");
  //     //_showItemDialog(message);
  //   },
  //   onLaunch: (Map<String, dynamic> message) async {
  //     print("onLaunch: $message");
  //     //_navigateToItemDetail(message);
  //   },
  //   onResume: (Map<String, dynamic> message) async {
  //     print("onResume: $message");
  //     //_navigateToItemDetail(message);
  //   },
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Central de Eventos';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: SplashScreen(),
    );
  }
}

