import 'package:flutter/material.dart';

class sixtab extends StatefulWidget {
  const sixtab({Key? key}) : super(key: key);

  @override
  State<sixtab> createState() => _sixtabState();
}

class _sixtabState extends State<sixtab> {
  @override
  Widget build(BuildContext context) {
    return Container( alignment: Alignment.center,
        child: Text(
            "Six"
        ));
  }
}
