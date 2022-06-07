import 'package:flutter/material.dart';

class sliver extends StatefulWidget {
  const sliver({Key? key}) : super(key: key);

  @override
  _sliverState createState() => _sliverState();
}

class _sliverState extends State<sliver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: true,
          leading: Icon(Icons.person_rounded, size: 70),
          automaticallyImplyLeading: false,
          // backgroundColor: Colors.blue,
          title: Text('Sliver AppBar', textAlign: TextAlign.center),
          expandedHeight: 30,
          collapsedHeight: 150,
        ),
        SliverAppBar(
          // backgroundColor: Colors.blueGrey,
          title: Text('Sliver AppBar'),
          floating: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Card(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 10,
                margin: const EdgeInsets.all(10),
                child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.yellow[100 * (index % 5 + 1)],
                    ),
                    child: Text(
                      "Item $index",
                      style: const TextStyle(fontSize: 20),
                    )),
              );
            },
            childCount: 100, // 1000 list items
          ),
        ),
      ],
    ));
  }
}
