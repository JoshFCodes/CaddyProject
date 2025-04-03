import 'package:fb_caddy_project/PagesToBeIntegrated/manager_booked_loops.dart';
import 'package:fb_caddy_project/PagesToBeIntegrated/CaddyPages/caddy_home.dart';
import 'package:fb_caddy_project/PagesToBeIntegrated/ManagerPages/Manager_Home.dart';
import 'package:fb_caddy_project/Skeleton%20Pages/auth_gate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fb_caddy_project/IntegratedPages/loop_market.dart';

//import 'screens/home_screen.dart';
//import 'screens/login_screen.dart';
//import 'screens/manager_screen.dart';
//import 'firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Check if the user is signed in and sign them out automatically
  // For testing purposes only
  //await _signOutUser();

  runApp(MyApp());
}


//TODO testing function
Future<void> _signOutUser() async {
  // Check if there's a currently signed-in user
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {

    //TODO testing signout
    // Sign out the user
    //await FirebaseAuth.instance.signOut();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Firebase Auth',
      theme: CupertinoThemeData(primaryColor: Colors.blue),
      home: AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Listen to authentication state
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // If the user is not logged in
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData) {
          // User is signed in, navigate based on their UID
          User? user = snapshot.data;

          // Check if the user is a manager or a regular user
          return FutureBuilder<bool>(
            future: checkIfManager(user!.uid),
            builder: (context, managerSnapshot) {
              if (managerSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (managerSnapshot.data == true) {
                // Navigate to Manager Screen
                return ManagerHome();
              } else {
                // Navigate to Regular User Screen (Home Screen)
                return CaddyHome();
              }
            },
          );
        } else {
          // User is not signed in, show the login screen
          return AuthGate();
        }
      },
    );
  }

  // Function to check if the user is a manager (based on their UID)
  Future<bool> checkIfManager(String uid) async {
    // Simulate checking from Firestore for the user's UID
    // Replace this with a Firestore query to check if the UID exists in the managers collection
    try {
      var doc = await FirebaseFirestore.instance.collection('managers').doc(uid).get();
      return doc.exists;
    } catch (e) {
      return false;
    }
  }
}
