import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class logo extends StatefulWidget {
  const logo({Key? key}) : super(key: key);

  @override
  State<logo> createState() => _logoState();
}

class _logoState extends State<logo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            Container(
                height: 100,
                width: 100,
                child: Image(
                  image: AssetImage("image/1x.png"),
                )),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Text("1X")),
            ),
            Container(
                height: 100,
                width: 100,
                child: Image(
                  image: AssetImage("image/2x.png"),
                )),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Text("2X")),
            ),
            Container(
                height: 100,
                width: 100,
                child: Image(
                  image: AssetImage("image/3x.png"),
                )),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Text("3X")),
            ),
          ],
        ),
      ),
    );
  }
}
