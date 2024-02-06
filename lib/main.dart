import 'package:flutter/material.dart';

import 'package:flutter_course/login_screen.dart';
import 'package:flutter_course/messenger_screen.dart';

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
      home: MessengerScreen(),
    );
  }
}
