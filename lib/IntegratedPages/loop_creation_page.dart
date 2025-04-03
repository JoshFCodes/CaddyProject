import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_caddy_project/Components/Page Elements/nav_bar.dart';
import 'package:fb_caddy_project/PagesToBeIntegrated/manager_booked_loops.dart';

class LoopCreationPage extends StatefulWidget {
  const LoopCreationPage({super.key});

  @override
  State<LoopCreationPage> createState() => _LoopCreationPageState();
}

class _LoopCreationPageState extends State<LoopCreationPage> {
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _golferController = TextEditingController();
  final TextEditingController _caddyController = TextEditingController();

  Future<void> _submitLoop() async {
    if (_typeController.text.isEmpty ||
        _dateController.text.isEmpty ||
        _timeController.text.isEmpty ||
        _golferController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("All fields must be filled!")),
      );
      return;
    }

    await FirebaseFirestore.instance.collection('open-loops').add({
      'Type': _typeController.text,
      'Date': _dateController.text,
      'Time': _timeController.text,
      'Golfer': _golferController.text,
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ManagerBookedLoops()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color.fromARGB(255, 134, 152, 129),
      navigationBar: MainBar(
        centerText: "WELCOME, Josh",
        backgroundColor: Color.fromARGB(255, 134, 152, 129),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 25),
              Divider(color: Colors.grey[400], thickness: 2),
              Text("Create Loop", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700)),
              Divider(color: Colors.grey[400], thickness: 2),
              SizedBox(height: 60),
              _buildInputField("Set Type", _typeController),
              _buildInputField("Set Date", _dateController),
              _buildInputField("Set Time", _timeController),
              _buildInputField("Set Golfer", _golferController),
              SizedBox(height: 90),
              GestureDetector(
                onTap: _submitLoop,
                child: Container(
                  height: 70,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 80),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 25, 104, 37),
                        Color.fromARGB(255, 116, 148, 34),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text(
                      "Confirm Loop",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, top: 10, end: 20),
      child: Column(
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.w700)),
          CupertinoTextField(
            controller: controller,
            textAlign: TextAlign.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color.fromARGB(255, 187, 206, 181),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
