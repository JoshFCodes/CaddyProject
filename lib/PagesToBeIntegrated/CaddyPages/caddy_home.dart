import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fb_caddy_project/Components/Page Elements/nav_bar.dart';
import 'package:fb_caddy_project/IntegratedPages/loop_market.dart';
import 'package:fb_caddy_project/PagesToBeIntegrated/CaddyPages/set_availability.dart';
import 'package:fb_caddy_project/PagesToBeIntegrated/CaddyPages/booked_loops.dart';

class CaddyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = const Color.fromARGB(255, 134, 152, 129);
    //Color loopBackgroundColor = const Color.fromARGB(255, 223, 212, 179);

    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,

        //FIXME will need to add variable to headers for caddy name
        navigationBar: MainBar(
          centerText: "WELCOME, Josh",
          backgroundColor: backgroundColor,
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),

                Text(
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                    "Your next Loop:"),

                const SizedBox(height: 50),

                //FIXME needs variables to present next loop information

                Text(style: TextStyle(fontSize: 30), "Single Bag: Ouimet"),

                const SizedBox(height: 20),

                Text(style: TextStyle(fontSize: 30), "Tues, 4/1"),

                const SizedBox(height: 20),

                Text(style: TextStyle(fontSize: 30), "10:21 a.m."),

                const SizedBox(height: 120),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OpenMarketPage()),
                    );
                  },
                  child: Container(
                    height: 80,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 49, 98, 56),
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                        child: Text(
                      "Available Loops",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
                  ),
                ),

                const SizedBox(height: 50),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookedLoops()),
                    );
                  },
                  child: Container(
                    height: 80,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 49, 98, 56),
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                        child: Text(
                      "Booked Loops",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
                  ),
                ),

                const SizedBox(height: 50),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SetAvailability()),
                    );
                  },
                  child: Container(
                    height: 80,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 49, 98, 56),
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                        child: Text(
                      "Set Availability",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
