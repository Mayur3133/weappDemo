import 'package:flutter/material.dart';
import 'package:fluttertask/Week1/1.3.dart';

class four extends StatefulWidget {
  const four({Key? key}) : super(key: key);

  @override
  State<four> createState() => _fourState();
}

class _fourState extends State<four> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,
        title: Text('Navigation'),
      ),
      body: SafeArea(
        child: InkWell(onTap:() {
          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context){
            return navi();
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
                child: Text('Ok',style: TextStyle(fontSize: 20,color: Colors.white),
                ),
              ),
            ),),
        ),

      ),
    );
  }
}
