import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget{

    final Function()? onTap;
    final String promptText;

    const RectangleButton({super.key, required this.onTap,
    required this.promptText});

  @override
  Widget build(BuildContext context){
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130,
        height: 130,
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          color: Color.fromARGB(150, 25, 104, 37),
          borderRadius: BorderRadius.circular(25)
        ),
        child: Center(child: 
        Text(promptText,
        style : TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        textAlign: TextAlign.center
        )),
      ),
    );
  }
}