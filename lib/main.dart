import 'package:flutter/material.dart';
import 'package:flutter_course/home_screen.dart';
import 'package:flutter_course/second_screen.dart';
import 'package:flutter_course/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
