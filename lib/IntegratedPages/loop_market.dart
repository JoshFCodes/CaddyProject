import 'package:flutter/cupertino.dart'; 
import 'package:flutter/material.dart';
import 'package:fb_caddy_project/Components/Page Elements/nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OpenMarketPage extends StatefulWidget {
  @override
  _OpenMarketPage createState() => _OpenMarketPage();
}

class _OpenMarketPage extends State<OpenMarketPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late Future<List<DocumentSnapshot>> _users;

  Future<List<DocumentSnapshot>> fetchData() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('open-loops').get();
      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  Future<void> acceptLoop(DocumentSnapshot loopDoc) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: Text("Error"),
            content: Text("User not logged in!"),
            actions: [
              CupertinoDialogAction(
                child: Text("OK"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
        return;
      }

      Map<String, dynamic> loopData = loopDoc.data() as Map<String, dynamic>;
      String userId = currentUser.uid;

      QuerySnapshot caddyQuery = await _firestore
          .collection('caddies')
          .where('id', isEqualTo: userId)
          .limit(1)
          .get();

      if (caddyQuery.docs.isNotEmpty) {
        DocumentReference caddyDoc = caddyQuery.docs.first.reference;
        await caddyDoc.update({
          'my-loops': FieldValue.arrayUnion([loopData])
        });
      } else {
        print("No matching caddy document found.");
        return;
      }

      await loopDoc.reference.delete();

      setState(() {
        _users = fetchData();
      });

      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text("Success"),
          content: Text("Loop accepted and added to your loops!"),
          actions: [
            CupertinoDialogAction(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    } catch (e) {
      print('Error accepting loop: $e');
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text("Error"),
          content: Text("Error accepting loop: $e"),
          actions: [
            CupertinoDialogAction(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _users = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = const Color.fromARGB(255, 134, 152, 129);
    Color loopBackgroundColor = const Color.fromARGB(255, 223, 212, 179);

    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      navigationBar: MainBar(
        centerText: "Open Loops",
        backgroundColor: backgroundColor,
      ),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: FutureBuilder<List<DocumentSnapshot>>(
          future: _users,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No loops available.'));
            } else {
              final users = snapshot.data!;

              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final userDoc = users[index];
                  final user = userDoc.data() as Map<String, dynamic>;

                  return GestureDetector(
                    onTap: () async {
                      bool? confirm = await showCupertinoDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                          title: Text("Accept Loop"),
                          content: Text("Do you want to accept this loop?"),
                          actions: [
                            CupertinoDialogAction(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text("Cancel"),
                            ),
                            CupertinoDialogAction(
                              onPressed: () => Navigator.pop(context, true),
                              isDefaultAction: true,
                              child: Text("Accept"),
                            ),
                          ],
                        ),
                      );

                      if (confirm == true) {
                        acceptLoop(userDoc);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: CupertinoColors.black),
                          color: loopBackgroundColor,
                        ),
                        height: 120.0,
                        alignment: Alignment.center,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(user['Golfer'] ?? 'No Name',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w800)),
                                    SizedBox(height: 10),
                                    Text(user['Type'] ?? 'No Type'),
                                  ],
                                ),
                              ),
                            ),
                            VerticalDivider(
                              indent: 10,
                              endIndent: 10,
                              color: Color.fromARGB(255, 136, 117, 95),
                              thickness: 1.0,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(user['Date'] ?? 'No Date',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w800)),
                                    SizedBox(height: 10),
                                    Text(user['Time'] ?? 'No Time'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
