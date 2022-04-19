import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<Offset>? offset;

  @override

  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(microseconds: 500));
    offset = Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero).animate(
        CurvedAnimation(parent: controller!, curve: Curves.decelerate));
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Drawer"),
          leading: IconButton(
            onPressed: () {
              switch (controller!.status) {
                case AnimationStatus.completed:
                  controller!.reverse();
                  break;
                case AnimationStatus.dismissed:
                  controller!.forward();
                  break;
                default:
              }
            },
            icon: Icon(Icons.menu),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            switch (controller!.status) {
              case AnimationStatus.completed:
                controller!.reverse();
                break;
              default:
            }
          },
          child: Container(
            height: 800,
            width: 500,
            color: Colors.white,
            child: Stack(
              children: [
                Center(
                  child: Text("Drawer",style: TextStyle(fontSize: 20)),
                ),
                _drawer(context),
              ],
            ),
          ),
        ));
  }

  Widget _drawer(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: SlideTransition(
            position: offset!,
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Container(
                height: 800,
                width: 300,
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Container(
                      color: Colors.lightBlueAccent,
                      height: 160,
                      width: 300,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 20,
                            top: 30,
                            child: Container(width: 60,height: 60,decoration: BoxDecoration(shape: BoxShape.circle),
                              // backgroundColor: Colors.white,
                              // maxRadius: 40,
                              child:Image(image: AssetImage('image/user.jpg'),)

                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 100,
                            child: Text(
                              "Mayur Parmar",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 130,
                            child: Text("myr1234@gamil.com"),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(border:Border(bottom: BorderSide(color: Colors.black12))),
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Text("      Home", style: TextStyle(fontSize: 20)),
                    ),
                    Container(
                      decoration: BoxDecoration(border:Border(bottom: BorderSide(color: Colors.black12))),
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Text("      Profile", style: TextStyle(fontSize: 20)),
                    ),
                    Container(
                      decoration: BoxDecoration(border:Border(bottom: BorderSide(color: Colors.black12))),
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Text("      Settings", style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
