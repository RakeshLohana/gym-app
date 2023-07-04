
import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String textitem;
  final VoidCallback onTap;

  ReusableButton({super.key, required this.textitem,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      
      child: Container(
        height: 60,
        decoration: BoxDecoration(
                color: Colors.white,
      
          border: Border.all(
            color: Colors.black
          ),
          
           
            borderRadius:  BorderRadius.all(
              
              
      
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
        ),)
            ]),
        child: Center(
          child: Text(
            textitem,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 0.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
