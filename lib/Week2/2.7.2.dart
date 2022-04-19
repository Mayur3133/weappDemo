import 'package:flutter/material.dart';

class ckbox extends StatefulWidget {
  const ckbox({Key? key}) : super(key: key);

  @override
  State<ckbox> createState() => _ckboxState();
}

class _ckboxState extends State<ckbox> {
  bool Dart = false;
  bool Flutter = false;
  bool C = false;
  bool PHP = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Box'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  Dart = !Dart;
                });
              },
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 25,
                    width: 25,
                    child: Icon(Icons.check,color: Colors.white),
                    decoration: BoxDecoration(
                        color: Dart ? Colors.redAccent : Colors.white,
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.black)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(5),
                    height: 30,
                    width: 100,
                    child: Text('Dart', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Flutter = !Flutter;
                });
              },
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 25,
                    width:  25,
                    child: Icon(Icons.check,color: Colors.white),
                    decoration: BoxDecoration(
                        color: Flutter ? Colors.redAccent : Colors.white,
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.black)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(5),
                    height: 30,
                    width:  100,
                    child: Text(
                      'Flutter',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(onTap: () {
              setState(() {
                C = !C;
              });
            },
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 25,
                    width:  25,
                    child: Icon(Icons.check,color: Colors.white),
                    decoration: BoxDecoration(
                         color: C  ? Colors.redAccent : Colors.white,
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.black)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(5),
                    height: 30,
                    width:  100,
                    child: Text('C', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
            InkWell(onTap: () {
              setState(() {
                PHP = !PHP;
              });
            },
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 25,
                    width: 25,
                    child: Icon(Icons.check,color: Colors.white),
                    decoration: BoxDecoration(
                         color: PHP ? Colors.redAccent : Colors.white,
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.black)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(5),
                    height: 30,
                    width: 100,
                    child: Text('PHP', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
