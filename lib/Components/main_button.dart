//import 'package:caddy_proj/Pages/CaddyPages/caddy_home.dart';
import 'package:fb_caddy_project/PagesToBeIntegrated/ManagerPages/Manager_Home.dart';
import 'package:flutter/material.dart';
//import 'package:caddy_proj/Pages/CaddyPages/loop_market.dart';


class MyButton extends StatelessWidget{


    final String promptText;
    
    final dynamic onTap;

    const MyButton({super.key, required this.onTap,
    required this.promptText});

  @override
  Widget build(BuildContext context){
    return  GestureDetector(
      onTap: () {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ManagerHome()),
      );
    },
    child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 25, 104, 37),
          borderRadius: BorderRadius.circular(25)
        ),
        child: Center(child: 
        Text(promptText,
        style : TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      
        )),
      ),
    );
  }


}