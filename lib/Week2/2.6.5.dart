import 'package:flutter/material.dart';

class donate extends StatefulWidget {
  const donate({Key? key}) : super(key: key);

  @override
  State<donate> createState() => _donateState();
}

class _donateState extends State<donate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Icon(Icons.clean_hands_sharp),

        ),
      ),
    );
  }
}
