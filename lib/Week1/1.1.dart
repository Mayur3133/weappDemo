import 'package:flutter/material.dart';

class flt extends StatefulWidget {
  const flt({Key? key}) : super(key: key);

  @override
  _fltState createState() => _fltState();
}

class _fltState extends State<flt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
       //   decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF9ccc65),Color(0xFFc5E1A5)]),),
          child:ListView(
            children: [
              Container(
                alignment: Alignment.center,
                child:Text('What is Flutter?',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              ),
              Container(
              margin: EdgeInsets.only(top: 20),
              child: Text('''      In the last few years of this decade, we have seen a lot of app startups emerging from all across the globe. With the rise in technology and the availability of smartphones, many startups find it easy to connect with users and clients via apps. The app market has also grown in the last few years and is expected to grow exponentially in the coming decade.\n
       The app development market has also been on a rise and has allowed a countless number of app developers to exhibit their skills and find a suitable job. With this shift into apps, much development and research have been done to deliver the best and to make the app development process faster and much simpler.''',
              style: TextStyle(height:2),
              ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
