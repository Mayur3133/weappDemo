import 'package:flutter/material.dart';

class fourtab extends StatefulWidget {
  const fourtab({Key? key}) : super(key: key);

  @override
  State<fourtab> createState() => _fourtabState();
}

class _fourtabState extends State<fourtab> {
  @override
  Widget build(BuildContext context) {
    return Container( alignment: Alignment.center,
        child: Text(
            "Four"
        ));
  }
}
