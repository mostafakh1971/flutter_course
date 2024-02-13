import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class HomeSreen extends StatefulWidget {
  HomeSreen({super.key});

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  double rate = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rating Star"),
        actions: [
          Icon(
            Icons.notifications,
          )
        ],
        iconTheme: IconThemeData(color: Color.fromARGB(255, 214, 14, 134)),
      ),
      drawer: Drawer(),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Rating"),
            AnimatedRatingStars(
                filledColor: Colors.amber,
                animationDuration: Duration(milliseconds: 700),
                animationCurve: Curves.bounceOut,
                onChanged: (value) {},
                customFilledIcon: Icons.star,
                customHalfFilledIcon: Icons.star_half_outlined,
                customEmptyIcon: Icons.star_border),
            RatingStars(
              starSize: 30,
              starColor: Colors.red,
              value: rate,
              onValueChanged: (value) {
                setState(() {
                  rate = value;
                });
              },
              animationDuration: Duration(milliseconds: 700),
            )
          ],
        ),
      ),
    );
  }
}
