import 'package:flutter/material.dart';

class NavigatorButton extends StatelessWidget {
  final String textitem;
  final VoidCallback onTap;
  final bool isloading;
  NavigatorButton({super.key, required this.textitem, required this.onTap,this.isloading=false});

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
        child:  Center(
            child: isloading ? CircularProgressIndicator(strokeWidth: 2,color: Colors.white,) :Text(
          textitem,
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
