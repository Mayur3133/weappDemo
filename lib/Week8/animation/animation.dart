import 'package:flutter/material.dart';

class anim extends StatefulWidget {
  static String routeName = '/misc/anim';

  const anim({Key? key}) : super(key: key);

  @override
  State<anim> createState() => _animState();
}

class _animState extends State<anim> {
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              duration: Duration(milliseconds: 800),
              tween: Tween(begin: 0.0, end: _value),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(value * 200 - 100, 0),
                  child: Container(
                      width: 120, height: 120, color: Colors.orangeAccent),
                );
              },
            ),
            Slider.adaptive(
              activeColor: Colors.orange[800],
              inactiveColor: Colors.orangeAccent,
              value: _value,
              onChanged: (value) => setState(() => _value = value),
            ),
          ],
        ),
      ),
    );
  }
}
