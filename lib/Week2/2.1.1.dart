import 'package:flutter/material.dart';

class firsttab extends StatefulWidget {
  const firsttab({Key? key}) : super(key: key);

  @override
  State<firsttab> createState() => _firsttabState();
}

class _firsttabState extends State<firsttab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Text("First"));
  }
}
