import 'package:flutter/material.dart';

class TodaysWorkoutContainer extends StatefulWidget {
  final Color color1;

  TodaysWorkoutContainer({Key? key, this.color1 = Colors.white,}) : super(key: key);

  @override
  _TodaysWorkoutContainerState createState() => _TodaysWorkoutContainerState();
}

class _TodaysWorkoutContainerState extends State<TodaysWorkoutContainer> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 10),
      child: Container(
        height:40,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isTapped ? Colors.grey : widget.color1,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0, // soften the shadow
              spreadRadius: 3.0, // extend the shadow
              offset: Offset(
                -5.0, // Move to the right 5 horizontally
                3.0, // Move to the bottom 5 vertically
              ),
            )
          ],
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isTapped = !isTapped;
            });
          },
          child: Icon(
            Icons.check,
            color: isTapped ? Colors.white : Colors.transparent,
          ),
        ),
      ),
    );
  }
}
