import 'package:application1/pages/Fpassword.dart';
import 'package:application1/pages/Home.dart';
import 'package:application1/pages/intro.dart';
import 'package:application1/pages/login.dart';
import 'package:application1/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/rendering.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'application',
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
            headline2: TextStyle(
                fontSize: 22,
                color: Colors.black.withAlpha(160),
                fontWeight: FontWeight.bold),
            headline3:
                TextStyle(fontSize: 20, color: Colors.white.withAlpha(140)),
            headline4: TextStyle(fontSize: 16)),
      ),
      routes: {
        "/login" : (context) =>  Login(),
        "/signup" : (context) =>  Signup(),
        "/Fpassword" :(context)=> Fpassword(),
      },
      home: intro(),
    );

  }
}
