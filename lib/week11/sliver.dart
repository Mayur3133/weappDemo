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
                margin: const EdgeInsets.all(15),
                child: Container(
                  color: Colors.yellow[100 * (index % 8 + 1)],
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "Item $index",
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              );
            },
            childCount: 100, // 1000 list items
          ),
        ),
      ],
    ));
  }
}
