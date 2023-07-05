import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String textitem;
  final Icon icon;
  final bool obscure;
  final TextEditingController controller;
  final void Function(String)? onSaved;
  TextFieldWidget({
    super.key,
    required this.textitem,
    required this.icon,
    required this.obscure, required this.controller, this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    var widget;
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 12.0, // soften the shadow
              spreadRadius: 3.0, //extend the shadow
              offset: Offset(
                -5.0, // Move to right 5  horizontally
                5.0, // Move to bottom 5 Vertically
              ),
            )
          ]),
      child: Center(
        child: GestureDetector(
            onTap: () {},
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  obscureText: obscure,
                  controller: controller,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      prefixIcon: icon,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: textitem),
                ))),
      ),
    );
  }
}
