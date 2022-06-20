import 'package:flutter/material.dart';
import 'package:get/get.dart';

class gestureexm extends StatefulWidget {
  const gestureexm({Key? key}) : super(key: key);

  @override
  State<gestureexm> createState() => _gestureexmState();
}

class _gestureexmState extends State<gestureexm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
            onPressed: () {
              Get.to(gesturedemo());
            },
            child: Text("Scale")),
        // ElevatedButton(
        //     onPressed: () {
        //       Get.to(TapScreen());
        //     },
        //     child: Text("Tap")),
      ])),
    );
  }
}

class gesturedemo extends StatefulWidget {
  const gesturedemo({Key? key}) : super(key: key);

  @override
  State<gesturedemo> createState() => _gesturedemoState();
}

class _gesturedemoState extends State<gesturedemo> {
  Color bgColor = Colors.yellow;
  bool makeCircular = false;
  double _scaleFactor = 0.5;
  double _baseScaleFactor = 0.5;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onScaleStart: (details) {
          _baseScaleFactor = _scaleFactor;
        },
        onScaleUpdate: (details) {
          setState(() {
            _scaleFactor = _baseScaleFactor * details.scale;
          });
        },
        onScaleEnd: (details) {
          // return to initial scale
          _scaleFactor = _baseScaleFactor;
        },
        child: Transform.scale(
          scale: _scaleFactor,
          child: Card(
            shape: makeCircular
                ? const CircleBorder()
                : const RoundedRectangleBorder(),
            child: const SizedBox(
              height: 100,
              width: 200,
            ),
            color: bgColor,
          ),
        ));
  }
}

class TapScreen extends StatefulWidget {
  @override
  _TapScreenState createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> {
  String tap = 'Tap';
  String doubletap = 'Double Tap';
  String longpress = 'Longpress';
  bool Tap = false;
  bool Doubletap = false;
  bool Longpress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.green,
          child: GestureDetector(
            onTap: () {
              print("TAP");
              setState(() {
                Tap = true;
                tap;
              });
            },
            onDoubleTap: () {
              print("DOUBLE TAP");
              setState(() {
                Doubletap = true;

                doubletap;
              });
            },
            onLongPress: () {
              print("LONG PRESS");
              setState(() {
                Longpress = true;

                longpress;
              });
            },
            child: InkWell(
              onTap: () {
                if (Tap == true) {
                  print(tap);
                }
                if (Doubletap == true) {
                  print(doubletap);
                }
                if (Longpress == true) {
                  print(longpress);
                }
              },
              child: Container(
                height: 100,
                width: 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
