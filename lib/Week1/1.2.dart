import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class inst extends StatefulWidget {
  const inst({Key? key}) : super(key: key);

  @override
  _instState createState() => _instState();
}

class _instState extends State<inst> {
  String url  = 'https://docs.flutter.dev/get-started/install/windows';
  String url2 = 'https://docs.flutter.dev/get-started/install/macos';
  String url3 = 'https://docs.flutter.dev/get-started/install/linux';
  String url4 = 'https://docs.flutter.dev/get-started/install/chromeos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child:ListView(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child:Text('Installation ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              ),
     
              Container(
                margin: EdgeInsets.only(top: 100,bottom: 20,left: 30,right: 30),
                child: ElevatedButton(style: ElevatedButton.styleFrom(
                    primary: Colors.orange, //background color of button
                    side: BorderSide(width:3, color:Colors.brown), //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(30)
                    ),
                    padding: EdgeInsets.all(20) //content padding inside button
                ) ,onPressed: () {
                          lunchurl();
                }, child: Text('For windows')),
              ),


              Container(
                margin: EdgeInsets.only(top: 30,bottom: 20,left: 30,right: 30),
                child: ElevatedButton(style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                    side: BorderSide(width:3, color:Colors.brown), //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(30)
                    ),
                    padding: EdgeInsets.all(20)
                ),onPressed: () {
                  lunchurl();
                }, child: Text('For MacOs')),
              ),


              Container(
                margin: EdgeInsets.only(top: 30,bottom: 20,left: 30,right: 30),
                child: ElevatedButton(style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    side: BorderSide(width:3, color:Colors.brown), //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(30)
                    ),
                    padding: EdgeInsets.all(20)
                ),onPressed: () {
                  lunchurl();
                }, child: Text('For Linux')),
              ),

              Container(
                margin: EdgeInsets.only(top: 30,bottom: 20,left: 30,right: 30),
                child: ElevatedButton(style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    side: BorderSide(width:3, color:Colors.brown), //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(30)
                    ),
                    padding: EdgeInsets.all(20)
                ),onPressed: () {
                  lunchurl();
                }, child: Text('For Chrome Os')),
              )

            ],
          ),
        ),
      ),
    );
  }

  void lunchurl ()async
  {
    if(await launch(url)) throw 'not launch $url' ;
  }

  void lauchurl2()async
  {
    if(await launch(url2)) throw 'not launch $url2';
  }

  void launchurl3()async
  {
    if(await launch(url3)) throw'not launch $url3';
  }

  void launchurl4()async
  {
    if(await launch(url4)) throw 'not launch $url4';
  }

}

