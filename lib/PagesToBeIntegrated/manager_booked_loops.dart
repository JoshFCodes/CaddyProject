import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fb_caddy_project/Components/Page Elements/nav_bar.dart';

//TODO some re-naming and method extraction

class ManagerBookedLoops extends StatefulWidget {
  @override
  _ManagerNookedLoops createState() => _ManagerNookedLoops();
}

class _ManagerNookedLoops extends State<ManagerBookedLoops> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late Future<List<Map<String, dynamic>>> _users;

  // Fetch data from Firestore
  Future<List<Map<String, dynamic>>> fetchData() async {
    try {
      // Fetching data from the 'open-loops' collection
      QuerySnapshot snapshot = await _firestore.collection('booked-loops').get();
      // Extracting the document data and returning it
      return snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    _users = fetchData(); // Fetch data when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = const Color.fromARGB(255, 134, 152, 129);
    Color loopBackgroundColor = const Color.fromARGB(255, 223, 212, 179);

    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      navigationBar: MainBar(
        centerText: "Booked Loops",
        backgroundColor: backgroundColor,
      ),
      child: Scaffold(
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: _users,
          builder: (context, snapshot) {
            // Check the state of the Future
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No data available.'));
            } else {
              // Display data in a ListView
              final users = snapshot.data!;

              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];

                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: CupertinoColors.black),
                        color: loopBackgroundColor,
                      ),
                      // A fixed-height child.
                      height: 120.0,
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          // Left Block
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Loop-Type
                                  Text(user['Golfer'] ?? 'No Name', style: TextStyle(fontSize: 20.0 ,fontWeight: FontWeight.w800)),
                                  SizedBox(height: 10), // White space
                                  // Golfer Last Name
                                  Text(user['Type'] ?? 'No Type'),
                                ],
                              ),
                            ),
                          ),
                          // Divider
                          const VerticalDivider(
                            indent: 10,
                            endIndent: 10,
                            color: Color.fromARGB(255, 136, 117, 95),
                            thickness: 1.0,
                          ),
                          // Right Block
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(user['Date'] ?? 'No Date', style: TextStyle(fontSize: 20.0 ,fontWeight: FontWeight.w800)),

                                  SizedBox(height: 10), // White space

                                  Text(user['Time'] ?? 'No Time'),

                                  SizedBox(height: 10), // White space

                                  Text(user['Caddy'] ?? 'No Caddy', style: TextStyle(fontSize: 15.0 ,fontWeight: FontWeight.w800)),

                                ],
                              ),
                            ),
                          ),
                        ],
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
