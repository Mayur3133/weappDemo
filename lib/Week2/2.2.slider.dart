import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sld extends StatefulWidget {
  const sld({Key? key}) : super(key: key);

  @override
  State<sld> createState() => _sldState();
}

class _sldState extends State<sld> {
  @override
  double vlu = 10;

  // String size = '10';
  Color clr = Colors.black;

  double stvlu = 10;
  double endvlu = 100;

  // String stsize ='10';
  // String endsize ='100';

  Color clrr = Colors.black;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.only(left: 30, right: 30, top: 200),
              child: FlutterSlider(
                values: [0],
                min: 0,
                max: 100,
                handler: FlutterSliderHandler(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('image/sldr.jpg')))),
              )
          ),
          // Text(
          //   'Size:${vlu.toInt()}',
          // ),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 50),
            child: RangeSlider(
              min: 0,
              max: 100,
              divisions: 20,
              labels: RangeLabels(
                stvlu.toString(),
                endvlu.toString(),
              ),
              values: RangeValues(stvlu, endvlu),
              onChanged: (values) {
                setState(() {
                  stvlu = values.start;
                  endvlu = values.end;
                });
              },
            ),
          ),
          Text(
            'Size: ${stvlu.toInt()} \n  Endsize: ${endvlu.toInt()}',
          ),
        ],
      ),
    );
  }
}
