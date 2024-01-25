import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 12,
        shadowColor: Colors.black,
      ),
      body: const SizedBox(
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "First Text",
              style: TextStyle(fontSize: 18, backgroundColor: Colors.amber),
            ),
            Text("Second Text",
                style: TextStyle(
                    fontSize: 18,
                    backgroundColor: Colors.green,
                    fontStyle: FontStyle.italic))
          ],
        ),
      ),
    );
  }
}
