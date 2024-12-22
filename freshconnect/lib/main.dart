import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freshconnect/screens/welcome.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyBBK3zRcS6mzMih8Qjk-EtOFtikAxqXYy0",
  authDomain: "freshconnect-725f0.firebaseapp.com",
  projectId: "freshconnect-725f0",
  storageBucket: "freshconnect-725f0.firebasestorage.app",
  messagingSenderId: "459026601483",
  appId: "1:459026601483:web:f575697b23c5c17824d90e"
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FreshConnect',
      
      home:const Welcome(),
    );
  }
}