import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fb_caddy_project/Components/Page Elements/nav_bar.dart';
//import 'package:caddy_proj/Pages/CaddyPages/loop_market.dart';
import 'package:fb_caddy_project/PagesToBeIntegrated/CaddyPages/set_availability.dart';
import 'package:fb_caddy_project/PagesToBeIntegrated/CaddyPages/booked_loops.dart';
import 'package:fb_caddy_project/IntegratedPages/loop_creation_page.dart';
import 'package:fb_caddy_project/PagesToBeIntegrated/ManagerPages/manager_list.dart';

class ManagerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = const Color.fromARGB(255, 134, 152, 129);
    //Color loopBackgroundColor = const Color.fromARGB(255, 223, 212, 179);

    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,

        navigationBar: MainBar(
          centerText: "WELCOME, Manager",
          backgroundColor: backgroundColor,
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),

                //TODO Loopcreate logic
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoopCreationPage()),
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
                      "Create a loop",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
                  ),
                ),

                const SizedBox(height: 50),

                //FIXME REPLACE PAGEROUTE

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
                      "View Open Loops",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
                  ),
                ),

                const SizedBox(height: 50),

                //FIXME REPLACE PAGEROUTE

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
                      "View booked loops",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
                  ),
                ),

                const SizedBox(height: 50),

                //FIXME REPLACE PAGEROUTE

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ManagerList()),
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
                      "View Caddy list",
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
