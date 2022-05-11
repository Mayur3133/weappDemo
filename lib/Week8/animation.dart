import 'package:flutter/material.dart';

class anim extends StatefulWidget {
  const anim({Key? key}) : super(key: key);

  @override
  State<anim> createState() => _animState();
}

class _animState extends State<anim> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? colorAnimation;
  Animation? sizeAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller!);
    sizeAnimation =
        Tween<double>(begin: 100.0, end: 200.0).animate(controller!);

    controller!.addListener(() {
      setState(() {});
    });

    controller!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Demo"),
      ),
      body: Center(
        child: Container(
          height: sizeAnimation!.value,
          width: sizeAnimation!.value,
          color: colorAnimation!.value,
        ),
      ),
    );
  }
}
