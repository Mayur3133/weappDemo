import 'package:flutter/material.dart';

class secondtab extends StatefulWidget {
  const secondtab({Key? key}) : super(key: key);

  @override
  State<secondtab> createState() => _secondtabState();
}

class _secondtabState extends State<secondtab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Text(
        "Second"
    ));
  }
}
