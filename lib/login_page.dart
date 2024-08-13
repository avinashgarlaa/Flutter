// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:login_app/homepage.dart';
import 'package:login_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 9, 130, 229),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_circle,
                color: Colors.blue,
                size: 50,
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                    label: Text("EMAIL"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    suffixIcon: Icon(Icons.email)),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(
                    label: Text("PASSWORD"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    suffixIcon: Icon(Icons.lock)),
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () async {
                  //if succesfully logged in
                  var sharedPref = await SharedPreferences.getInstance();
                  sharedPref.setBool(splashPageState.KEYLOGIN,true);

                  // ignore: use_build_context_synchronously
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                style: ButtonStyle(),
                child: Text("LogIn"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
