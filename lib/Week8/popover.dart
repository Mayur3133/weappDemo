import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class PopoverExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Popover Example')),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Button(),
              ),
            ]
          ),
        ),
      );

  }
}
class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: GestureDetector(
        child:  Center(child: Text('Ok',style: TextStyle(color: Colors.white),)),
        onTap: () {
          showPopover(
            context: context,
            transitionDuration: const Duration(milliseconds: 150),
            bodyBuilder: (context) => const ListItems(),
            onPop: () => print('Popover was popped!'),
            direction: PopoverDirection.top,
            width: 200,
            height: 350,
            arrowHeight: 15,
            arrowWidth: 30,
          );
        },
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Container(
              height: 50,
              color: Colors.red[300],
              child: const Center(child: Text('1')),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.red[300],
              child: const Center(child: Text('2')),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.red[300],
              child: const Center(child: Text('3')),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.red[300],
              child: const Center(child: Text('4')),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.red[300],
              child: const Center(child: Text('5')),
            ),
          ],
        ),
      ),
    );
  }
}