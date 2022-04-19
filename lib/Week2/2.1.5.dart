import 'package:flutter/material.dart';

class fivetab extends StatefulWidget {
  const fivetab({Key? key}) : super(key: key);

  @override
  State<fivetab> createState() => _fivetabState();
}

class _fivetabState extends State<fivetab> {
  @override
  Widget build(BuildContext context) {
    return Container( alignment: Alignment.center,
        child: Text(
            "five"
        ));
  }
}
