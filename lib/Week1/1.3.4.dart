import 'package:flutter/material.dart';

class s1 extends StatelessWidget {
  const s1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => s2(),
                    ));
              },
              child: Text("S1")),
        ],
      )),
    );
  }
}

class s2 extends StatelessWidget {
  const s2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => s3(),
                    ));
              },
              child: Text("S2")),
        ],
      )),
    );
  }
}

class s3 extends StatefulWidget {
  const s3({Key? key}) : super(key: key);

  @override
  State<s3> createState() => _s3State();
}

class _s3State extends State<s3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => s4(),
                    ));
              },
              child: Text("S3")),
        ],
      )),
    );
  }
}

class s4 extends StatelessWidget {
  const s4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName('s1'));
            },
            child: Text("S4")),
      ],
    )));
  }
}
