import 'package:flutter/material.dart';

class swtch extends StatefulWidget {
  const swtch({Key? key}) : super(key: key);

  @override
  State<swtch> createState() => _swtchState();
}

class _swtchState extends State<swtch> {
  bool on = false;
  bool off = false;
  bool swtch = false;
  bool cust = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Switch(
              value: swtch,
              onChanged: (value) {
                setState(() {
                  swtch = value;
                  print(swtch);
                });
              },
              activeTrackColor: Colors.blueAccent,
              activeColor: Colors.blue,
            ),
          ),
          Customs(
            onChanged: (bool value) {
              setState(() {
                cust = value;
              });
            },
            value: cust,
          )
        ],
      ),
    );
  }
}

class Customs extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  Customs({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  _CustomsState createState() => _CustomsState();
}

class _CustomsState extends State<Customs> with SingleTickerProviderStateMixin {
  Animation? _circleAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController!, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 45.0,
            height: 28.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: _circleAnimation!.value == Alignment.centerLeft
                  ? Colors.grey
                  : Colors.orange,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
              child: Container(
                alignment:
                    widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.yellow),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
