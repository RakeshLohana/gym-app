import 'package:flutter/material.dart';

class WorkoutContiner extends StatelessWidget {
  final String link;
    final String text;

  WorkoutContiner({super.key, required this.link, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,bottom: 20,right: 10,left: 10),
      child: Container(
        height: 80,
        width: 110,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0, // soften the shadow
                spreadRadius: 3.0, //extend the shadow
                offset: Offset(
                  -5.0, // Move to right 5  horizontally
                  5.0, // Move to bottom 5 Vertically
                ),
              )
            ]),
        child: GestureDetector(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    link,
                    height: 70,
                  ),
                ),
                Text(text)
              ],
            )),
      ),
    );
  }
}
