// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:login_app/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My HomePage",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 9, 130, 229),
      ),
      body: Container(
        color: const Color.fromARGB(255, 34, 70, 133),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 40),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>LoginPage()));
                  }, child: Text("LogOut"))
                  
                  ]
              ),
        ),
      )
    );
  }
}
