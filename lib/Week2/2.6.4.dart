import 'package:flutter/material.dart';

class nutrition extends StatefulWidget {
  const nutrition({Key? key}) : super(key: key);

  @override
  State<nutrition> createState() => _nutritionState();
}

class _nutritionState extends State<nutrition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: Icon(Icons.volunteer_activism),
      )),
    );
  }
}
