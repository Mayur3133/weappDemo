import 'package:flutter/material.dart';

class pro extends StatefulWidget {
  const pro({Key? key}) : super(key: key);

  @override
  State<pro> createState() => _proState();
}

class _proState extends State<pro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: Container(
        child: Icon(Icons.whatshot),

    ),)
    );
  }
}
