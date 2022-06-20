import 'package:flutter/material.dart';
import 'package:fluttertask/week12/bloc/bloc.dart';
import 'package:fluttertask/week12/provider.dart';



class week12 extends StatefulWidget {
  const week12({Key? key}) : super(key: key);

  @override
  State<week12> createState() => _week12State();
}

class _week12State extends State<week12> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("week-11")),
      body: Container(
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return provider();
                    },
                  ));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 15),
                  height: 130,
                  //width: double.infinity,
                  child: Card(
                    elevation: 30,
                    color: Colors.black54,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'Providers',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 15),
                  height: 130,
                  //width: double.infinity,
                  child: Card(
                    elevation: 30,
                    color: Colors.black54,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'Bloc',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(
              //       builder: (context) {
              //         return Container();
              //       },
              //     ));
              //   },
              //   child: Container(
              //     margin: EdgeInsets.only(bottom: 15),
              //     height: 130,
              //     //width: double.infinity,
              //     child: Card(
              //       elevation: 30,
              //       color: Colors.black54,
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10)),
              //       child: Center(
              //         child: Text(
              //           'Redux',
              //           style: TextStyle(fontSize: 20, color: Colors.white),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ]
        ),
      ),
    );
  }
}
