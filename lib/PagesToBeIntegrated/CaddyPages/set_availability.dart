import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fb_caddy_project/Components/Page Elements/nav_bar.dart';

class SetAvailability extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = const Color.fromARGB(255, 134, 152, 129);
    //Color loopBackgroundColor = const Color.fromARGB(255, 223, 212, 179);

    return CupertinoPageScaffold(
        backgroundColor: Color.fromARGB(255, 134, 152, 129),

        //FIXME will need to add variable to headers for caddy name
        navigationBar: MainBar(
          centerText: "WELCOME, Josh",
          backgroundColor: backgroundColor,
        ),
        child: SafeArea(
            child: Center(
                child: Column(children: [
          const SizedBox(
            height: 20,
          ),
                    
          Divider(
            color: Colors.grey[400],
            thickness: 2,
          ),

          Text(
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
              "Set your availability"),
          
          Divider(
            color: Colors.grey[400],
            thickness: 2,
          ),

          const SizedBox(height: 30),

          
          Text(
              style: TextStyle(fontSize: 20),
              "Select any day that you have limited/no availability",
              textAlign: TextAlign.center,
              ),

              //FIXME Calendar implementation here


        ]))));
  }
}
