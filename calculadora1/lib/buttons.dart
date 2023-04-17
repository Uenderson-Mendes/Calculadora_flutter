// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
  
// creating Stateless Wideget for buttons
class MyButton extends StatelessWidget {
    
  // declaring variables 
  final color;
  final textColor;
  final String buttonText;
  final buttontapped;
  
  //Constructor
  // ignore: prefer_const_constructors_in_immutables
  MyButton({this.color, this.textColor, required this.buttonText, this.buttontapped});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: ClipRRect(
          // borderRadius: BorderRadius.circular(25),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}