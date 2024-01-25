import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
        elevation: 8,
        shadowColor: Colors.black,
      ),
      body: const Center(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 65,
              backgroundImage: NetworkImage(
                  "https://th.bing.com/th/id/R.e20f7ec88066f86e7aad2950004169e8?rik=VsxPD3Pg4jtTLA&riu=http%3a%2f%2fupload.wikimedia.org%2fwikipedia%2fcommons%2fa%2fa9%2f20090809_Lotus_flower_2736.jpg&ehk=R%2fh6nva8bzB14hIEe1YBypqrfel6%2fmZx0SWoV5V7g0A%3d&risl=1&pid=ImgRaw&r=0"),
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 17,
            ),
            CircleAvatar(
              backgroundColor: Colors.green,
              radius: 15,
            )
          ],
        ),
      ),
    );
  }
}
