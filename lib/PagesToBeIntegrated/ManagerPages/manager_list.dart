import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:caddy_proj/Components/ManagerComps/caddy_element.dart';
import 'package:fb_caddy_project/Components/Page Elements/nav_bar.dart';

class ManagerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Color backgroundColor = const Color.fromARGB(255, 134, 152, 129);
    //Color loopBackgroundColor = const Color.fromARGB(255, 223, 212, 179);

    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: MainBar(centerText: "Current Caddies",backgroundColor: backgroundColor,),
        child: Center(
          child: ListView(
            children: <Widget>[
              Center(
              child: SingleChildScrollView(

              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[

                  //TODO Caddy Element will need to be taken from loop_market and changed for new data
                  //CaddyElement(backgroundColor:  loopBackgroundColor),
                  //CaddyElement(backgroundColor:  loopBackgroundColor),
                  //CaddyElement(backgroundColor:  loopBackgroundColor),
                  //CaddyElement(backgroundColor:  loopBackgroundColor),
                  //CaddyElement(backgroundColor:  loopBackgroundColor),
                  //CaddyElement(backgroundColor:  loopBackgroundColor),
                  //CaddyElement(backgroundColor:  loopBackgroundColor),
                  //CaddyElement(backgroundColor:  loopBackgroundColor),
                  //CaddyElement(backgroundColor:  loopBackgroundColor),
                
                  
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