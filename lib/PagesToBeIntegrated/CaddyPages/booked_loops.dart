import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fb_caddy_project/Components/Page Elements/nav_bar.dart';

class BookedLoops extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Color backgroundColor = const Color.fromARGB(255, 134, 152, 129);
    Color loopBackgroundColor = const Color.fromARGB(255, 176, 168, 142);

    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: MainBar(centerText: "Your Booked Loops",backgroundColor: backgroundColor,),
        child: Center(
          child: ListView(
            children: <Widget>[
              Center(
              child: SingleChildScrollView(

              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //OpenLoopListElement(backgroundColor:  loopBackgroundColor),
                  //OpenLoopListElement(backgroundColor:  loopBackgroundColor),
                
                ],
              ),
            ),
              ),
              
            ]
            ),
        )
        );
  }
}
