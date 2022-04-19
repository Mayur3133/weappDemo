import 'package:flutter/material.dart';
import 'package:fluttertask/Week2/2.7.3.dart';
import '2.7.1.dart';
import '2.7.2.dart';
import '2.7.4.dart';
import '2.7.5.dart';
import '2.7.6.dart';

class customcontrol extends StatefulWidget {
  const customcontrol({Key? key}) : super(key: key);

  @override
  State<customcontrol> createState() => _customcontrolState();
}

class _customcontrolState extends State<customcontrol> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Properties'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 300),
        child: Center(
          child: Column(
            children: [
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return cstm();
                        },
                      ));
                    },
                    child: Text('Radio btn')),
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ckbox();
                        },
                      ));
                    },
                    child: Text('Check Box')),
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return swtch();
                        },
                      ));
                    },
                    child: Text('Toggle Switch')),
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CustomDrawer();
                        },
                      ));
                    },
                    child: Text('Drawer')),
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return tab();
                        },
                      ));
                    },
                    child: Text('TabBar')),
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return bottomtab();
                        },
                      ));
                    },
                    child: Text('Bottom')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
