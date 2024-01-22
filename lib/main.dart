import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.menu),
            title: const Text("My First Project"),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.call))
            ],
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 12,
          ),
          body: Center(
            child: Container(
              width: 450,
              height: 250,
              decoration: BoxDecoration(
                  //  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(3, -3),
                        blurRadius: 8,
                        spreadRadius: 1,
                        color: Colors.black38)
                  ],
                  gradient: const LinearGradient(
                      colors: [
                        Colors.purple,
                        Colors.blue,
                      ],
                      //  stops: [
                      //   0.50,
                      //   0.25,
                      // ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(50)),
              child: const Center(
                child: Text(
                  "Welcome to our project",
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )),
    );
  }
}
