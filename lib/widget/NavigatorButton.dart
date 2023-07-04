import 'package:flutter/material.dart';

class NavigatorButton extends StatelessWidget {
  final String textitem;
  VoidCallback onTap;
   NavigatorButton({super.key, required this.textitem,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(
            child: Text(
          textitem,
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
