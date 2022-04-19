import 'package:flutter/material.dart';

class cstm extends StatefulWidget {
  const cstm({Key? key}) : super(key: key);

  @override
  State<cstm> createState() => _cstmState();
}

class _cstmState extends State<cstm> {
  List lst = ['1', '2', '3', '4'];
  int? slt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Btn'),
      ),
      body: Column(
        children: [
          Container(
            child: ListView.builder(
              itemCount: lst.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      slt = index;
                    });
                  },
                  title: Text(lst[index]),
                  leading: Container(
                    height: 20,
                    width: 20,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: index == slt ? Colors.redAccent : Colors.white,
                        shape: BoxShape.circle,border: Border.all(color: Colors.black)
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}