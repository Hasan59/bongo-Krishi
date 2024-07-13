import 'package:bongokrishi/View/Dashboard/bottomNavigationBar.dart';
import 'package:bongokrishi/View/Dashboard/homePage.dart';
import 'package:bongokrishi/View/Signup/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}