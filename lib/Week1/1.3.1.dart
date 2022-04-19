import 'package:flutter/material.dart';
import 'package:fluttertask/Week1/1.3.dart';

class secondpage extends StatefulWidget {
  const secondpage({Key? key}) : super(key: key);

  @override
  _secondpageState createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue,
        title: Text('Navigation'),
        ),
      body: SafeArea(
        child: InkWell(onTap:() {
          Navigator.pop(context);
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
                child: Text('Go back',style: TextStyle(fontSize: 20,color: Colors.white),
                ),
              ),
            ),),
        ),

      ),
    );
  }
}

