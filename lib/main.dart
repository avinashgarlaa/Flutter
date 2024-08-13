// ignore_for_file: prefer_const_constructors, camel_case_types
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_app/homepage.dart';
import 'package:login_app/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: splashPage(),
    );
  }
}

class splashPage extends StatefulWidget {
  const splashPage({super.key});

  @override
  State<splashPage> createState() => splashPageState();
}

class splashPageState extends State<splashPage> {
  // ignore: constant_identifier_names
  static const String KEYLOGIN = "Login";

  @override
  void initState() {
    super.initState();

    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color.fromARGB(255, 106, 206, 219),
      child: Center(
          child: Icon(
        Icons.account_circle,
        size: 100,
      )),
    ));
  }

  void whereToGo() async {
    var sharedpref = await SharedPreferences.getInstance();

    var isLoggedIn = sharedpref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 4), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }else{
           Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      }else{
         Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
  }
}
