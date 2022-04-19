import 'package:flutter/material.dart';
import 'package:fluttertask/Week1/1.3.3.dart';

import '1.3.dart';

class third extends StatefulWidget {
  const third({Key? key}) : super(key: key);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,
        title: Text('Navigation'),
      ),
      body: SafeArea(
        child: InkWell(onTap:() {
          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context){
            return four();
          }));
        } ,
          child: Container(  margin: EdgeInsets.only(top: 200,left: 70,right: 70),
            height: 100,
            //width: double.infinity,
            child:Card(
              elevation: 30,
              color: Colors.black54,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Text('Click',style: TextStyle(fontSize: 20,color: Colors.white),
                ),
              ),
            ),),
        ),

      ),
    );
  }
}
