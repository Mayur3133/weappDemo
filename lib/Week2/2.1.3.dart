import 'package:flutter/material.dart';

class thirdtab extends StatefulWidget {
  const thirdtab({Key? key}) : super(key: key);

  @override
  State<thirdtab> createState() => _thirdtabState();
}

class _thirdtabState extends State<thirdtab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Text(
      "Third"
    ));
  }
}
