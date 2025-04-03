import 'package:flutter/material.dart';

class LineWordsLine extends StatelessWidget{

  final String Words;

  const LineWordsLine({super.key, required this.Words});

  @override
  Widget build(BuildContext context){

    return Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey[400],
                    thickness: 2,)
                    ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 29.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text(
                        Words,
                        style: TextStyle(color: Color.fromARGB(255, 25, 104, 37),
                        fontSize: 16,
                        fontWeight: FontWeight.bold)
                        )
                      ]
                    )
                  ),
                Expanded(
                  child: Divider(
                    color: Colors.grey[400],
                    thickness: 2,)
                    ),
                ],
              ),
            );
}
}