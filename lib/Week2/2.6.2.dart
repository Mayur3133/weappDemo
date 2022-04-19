import 'package:flutter/material.dart';

class goout extends StatefulWidget {
  const goout({Key? key}) : super(key: key);

  @override
  State<goout> createState() => _gooutState();
}

class _gooutState extends State<goout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: Container(
        child: Icon(Icons.directions_walk_sharp),
        )

    ),
    );
  }
}
