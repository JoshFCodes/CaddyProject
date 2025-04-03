import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class textField extends StatelessWidget{

  final controller;
  final String hintText;
  final bool obscureText;

  const textField({
    super.key,
    required this.controller,
    required this. hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context){
    return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: CupertinoTextField(
                placeholder: hintText,
                placeholderStyle: TextStyle(
                  color: const Color.fromARGB(255, 96, 96, 96)
                ),
                controller: controller,
                obscureText: obscureText,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 101, 101, 101)),
                  borderRadius: BorderRadius.circular(8)
                ),
              ),
            );
      }
    }
  