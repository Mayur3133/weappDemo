import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class fst extends StatefulWidget {
  const fst({Key? key}) : super(key: key);

  @override
  State<fst> createState() => _fstState();
}

class _fstState extends State<fst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(40),
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.blueGrey,
                    offset: new Offset(5, 5),
                  ),
                ],
              ),
              child: Text("Hello", style: TextStyle(fontSize: 30)),
            ),
            Container(
              padding: EdgeInsets.all(40),
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.brown,
                    offset: new Offset(5, 5),
                  ),
                ],
              ),
              child: Text("Hello", style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
      ),
    );
  }
}

class scd extends StatefulWidget {
  const scd({Key? key}) : super(key: key);

  @override
  State<scd> createState() => _scdState();
}

class _scdState extends State<scd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 50),
                  height: 200,
                  child: Card(
                    child: Card(
                        margin: EdgeInsets.all(10),
                        elevation: 30,
                        color: Colors.indigo[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            ' Hello ',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        )),
                  )),
              Container(
                height: 200,
                margin: EdgeInsets.only(top: 20, left: 20, right: 50),
                child: Card(
                  margin: EdgeInsets.all(10),
                  color: Colors.deepOrange[400],
                  shadowColor: Colors.black,
                  elevation: 30,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.ac_unit_rounded,
                            color: Colors.cyan, size: 45),
                        title: Text(
                          "Hello",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text('How are you?'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}

class thd extends StatefulWidget {
  const thd({Key? key}) : super(key: key);

  @override
  State<thd> createState() => _thdState();
}

class _thdState extends State<thd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.indigo, Colors.blue])),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.indigo, Colors.blue])),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.indigo, Colors.blue])),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.indigo, Colors.blue])),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.indigo, Colors.blue])),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.indigo, Colors.blue])),
            ),
          ],
        ),
      ),
    );
  }
}

class fr extends StatefulWidget {
  const fr({Key? key}) : super(key: key);

  @override
  State<fr> createState() => _frState();
}

class _frState extends State<fr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    // height: 150,
                    //   width: 150,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.indigo, Colors.blue])),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    // height: 150,
                    //   width: 150,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.indigo, Colors.blue])),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 150,
                    //   width: 150,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.indigo, Colors.blue])),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150,
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    // height: 150,
                    //   width: 150,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.indigo, Colors.blue])),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    // height: 150,
                    //   width: 150,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.indigo, Colors.blue])),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 150,
                    //   width: 150,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.indigo, Colors.blue])),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class fv extends StatefulWidget {
  const fv({Key? key}) : super(key: key);

  @override
  State<fv> createState() => _fvState();
}

class _fvState extends State<fv> {
  initState() {
    super.initState();

    () async {
      var _permissionStatus = await Permission.storage.status;

      if (_permissionStatus != PermissionStatus.granted) {
        PermissionStatus permissionStatus = await Permission.storage.request();
        setState(() {
          _permissionStatus = permissionStatus;
        });
      }
    }();
  }

  @override
  Widget build(BuildContext context) {
    var file = new File('/storage/emulated/0/DCIM/Camera/test.jpg');
    return Container(
      //  fit: BoxFit.fill,
      // repeat: ImageRepeat.repeat,
      alignment: Alignment.topCenter,
      // color: Colors.blueGrey[300],
      //colorBlendMode: BlendMode.saturation,
      // child: Image.file(file)
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(150),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('https://picsum.photos/250?image=9'))),
          ),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("image/1.png"),
            )),
          )
        ],
      ),
    );
  }
}

class sx extends StatefulWidget {
  const sx({Key? key}) : super(key: key);

  @override
  State<sx> createState() => _sxState();
}

class _sxState extends State<sx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    width: 100,
                    decoration: BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage('image/img.jpg')),
                    ),
                  );
                },
              ),
            ),
            Container(
              // height: 150,
              child: Card(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 20,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('image/img.jpg'))),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class svn extends StatefulWidget {
  const svn({Key? key}) : super(key: key);

  @override
  State<svn> createState() => _svnState();
}

class _svnState extends State<svn> {
  //String vlu='Flutter';

  List lst = ['C', 'C++', 'Dart', 'PHP', 'Flutter', '.Net'];

  var vlu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                DropdownButton(
                  value: vlu,
                  icon: Icon(Icons.apps),
                  items: lst.map((lst) {
                    return DropdownMenuItem(value: lst, child: Text(lst));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      vlu = value.toString();
                    });
                  },
                  hint: Text("Please choose Option"),
                ),
              ],
            )),
      ),
    );
  }
}

class egt extends StatefulWidget {
  const egt({Key? key}) : super(key: key);

  @override
  State<egt> createState() => _egtState();
}

class _egtState extends State<egt> {
  List btm = [
    Text(
      ' Call',
      // style: optionStyle,
    ),
    Text(
      'Image',
      // style: optionStyle,
    ),
    Text(
      ' Add',
      // style: optionStyle,
    ),
    Text(
      'Search',
      // style: optionStyle,
    ),
  ];

  int crntindex = 0;

  void onTabTapped(int index) {
    setState(() {
      crntindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: btm.elementAt(crntindex)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: crntindex,
        selectedItemColor: Colors.white,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.add_call),
              label: 'Call'),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Image'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
    );
  }
}

class nn extends StatefulWidget {
  const nn({Key? key}) : super(key: key);

  @override
  State<nn> createState() => _nnState();
}

class _nnState extends State<nn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 100,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white38,
                          image: DecorationImage(
                            image: AssetImage('image/img.jpg'),
                          )),
                    );
                  }),
            ),
            Container(
              height: 30,
              color: Colors.blueGrey,
            ),
            Container(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 50,
                      mainAxisSpacing: 10,
                    ),
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 20,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 100,
                        height: 150,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white38,
                            image: DecorationImage(
                              image: AssetImage('image/img.jpg'),
                            )),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

class tn extends StatefulWidget {
  const tn({Key? key}) : super(key: key);

  @override
  State<tn> createState() => _tnState();
}

class _tnState extends State<tn> {
  List Product = ['1', '2', '3', '4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('No network!'),
                          content: Text('Please insert SIM card'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Ok'))
                          ],
                        );
                      });
                },
                child: Text('ok')),
            Container(height: 20),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text('No network!'),
                          content: Text('Please insert SIM card'),
                          actions: [
                            CupertinoDialogAction(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Ok'))
                          ],
                        );
                      });
                },
                child: Text('ok')),
            Container(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: Text('Select Item'),
                          children: <Widget>[
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(
                                  context, /*Product.Apple*/
                                );
                              },
                              child: Text('1'),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                );
                              },
                              child: Text('2'),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                );
                              },
                              child: Text('3'),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                );
                              },
                              child: Text('4'),
                            ),
                          ],
                        );
                      });
                });
              },
              child:  Text(
                "Click",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class elv extends StatefulWidget {
  const elv({Key? key}) : super(key: key);

  @override
  State<elv> createState() => _elvState();
}

class _elvState extends State<elv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 150, left: 100),
        child: Stack(
          children: [
            Container(
              height: 120,
              width: 120,
              //   color: Colors.deepOrangeAccent,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('image/111.jpg'), fit: BoxFit.cover),
                  //color: Colors.deepOrange,
                  shape: BoxShape.circle),
            ),
            Stack(
              children: [
                Positioned (
                  left: 60,
                  child: Container(
                    height: 120,
                    width: 120,
                    //   color: Colors.deepOrangeAccent,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('image/222.jpg'),
                            fit: BoxFit.cover),
                        // color: Colors.indigo,
                        shape: BoxShape.circle),
                  ),
                ),
                Stack(
                  children: [
                    Positioned(
                        left: 120,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('image/333.jpg'),
                                  fit: BoxFit.fill),
                              //color: Colors.purple,
                              shape: BoxShape.circle),
                        ))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class twl extends StatefulWidget {
  const twl({Key? key}) : super(key: key);

  @override
  State<twl> createState() => _twlState();
}

class _twlState extends State<twl> {
  String vlu = '';
  var pnt='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 100, left: 0),
        child: Column(
          children: [
            ListTile(
              title: Text('Dart'),
              leading: Radio(
                  value: 'Dart',
                  groupValue: vlu,
                  toggleable: true,
                  onChanged: (value) {
                    setState(() {
                      vlu = value.toString();
                    });
                  }),
            ),
            ListTile(
              title: Text('Flutter'),
              leading: Radio(
                  value: 'Flutter',
                  groupValue: vlu,
                  toggleable: true,
                  onChanged: (value) {
                    setState(() {
                      vlu = value.toString();
                    });
                  }),
            ),
            ListTile(
              title: Text('PHP'),
              leading: Radio(
                  value: 'PHP',
                  groupValue: vlu,
                  toggleable: true,
                  onChanged: (value) {
                    setState(() {
                      vlu = value.toString();
                    });
                  }),
            ),
            ListTile(
              title: Text('.NET'),
              leading: Radio(
                  value: '.Net',
                  groupValue: vlu,
                  toggleable: true,
                  onChanged: (value) {
                    setState(() {
                      vlu = value.toString();
                    });
                  }),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                     pnt = vlu;
                  });
                },
                child: Text('Ok')),
            Container(
              child: Text(pnt),
            )
          ],
        ),
      ),
    );
  }
}

class time extends StatefulWidget {
  const time({Key? key}) : super(key: key);

  @override
  State<time> createState() => _timeState();
}

class _timeState extends State<time> {
  TimeOfDay slcttime = TimeOfDay.now();

  shw() async {
    final TimeOfDay result =
        await showTimePicker(context: context, initialTime: slcttime)
            as TimeOfDay;
    if (result != null && result != slcttime) {
      setState(() {
        slcttime = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          children: [
            ElevatedButton(
              onPressed: () {
                shw();
              },
              child: Text('Show time picker')),
            Text("${slcttime.hour}:${slcttime.minute}"),
          ],
        ),

      ),

    );
  }
}

class date extends StatefulWidget {
  const date({Key? key}) : super(key: key);

  @override
  State<date> createState() => _dateState();
}

class _dateState extends State<date> {
  DateTime scltdate = DateTime.now();

  Show() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: scltdate,
      firstDate: DateTime(1999),
      lastDate: DateTime(2030),
    );
    if (date != null && date != scltdate) {
      setState(() {
        scltdate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Show();
                },
                child: Text('Show Date picker')),
                Text("${scltdate.toLocal()}".split(' ')[0]),
          ],
        ),

      ),

    );
  }
}

class chkbox extends StatefulWidget {
  const chkbox({Key? key}) : super(key: key);

  @override
  State<chkbox> createState() => _chkboxState();
}

class _chkboxState extends State<chkbox> {
  bool? yes = false;
  bool? no = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 50,
              width: 500,
              child: CheckboxListTile(
                title: Text("Yes"),
                controlAffinity: ListTileControlAffinity.leading,
                value: yes,
                onChanged: (bool? value) {
                  setState(() {
                    if (yes = true) {
                      no = false;
                    }
                    yes = value;
                  });
                },
              ),
            ),
            Container(
              height: 50,
              width: 500,
              child: CheckboxListTile(
                title: Text("No"),
                value: no,
                onChanged: (bool? value) {
                  setState(() {
                    if (no = true) {
                      yes = false;
                    }
                    no = value;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Ok"))
          ],
        ),
      ),
    );
  }
}

class srch extends StatefulWidget {
  const srch({Key? key}) : super(key: key);

  @override
  State<srch> createState() => _srchState();
}

class _srchState extends State<srch> {
  List srlst = [
    "Apple",
    "Apricot",
    "Banana",
    "Blackberry",
    "Coconut",
    "Date",
    "Fig",
    "Gooseberry",
    "Grapes",
    "Lemon",
    "Litchi",
    "Mango",
    "Orange",
    "Papaya",
    "Peach",
    "Pineapple",
    "Pomegranate",
    "Starfruit"
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Search"), actions: [
        IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: Icon(Icons.search))
      ]),
      body: ListView.builder(
        itemCount: srlst.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            child: Text(srlst[index],style: TextStyle(fontSize: 20),),
          );
        },
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List searchTerms = [
    "Apple",
    "Apricot",
    "Banana",
    "Blackberry",
    "Coconut",
    "Date",
    "Fig",
    "Gooseberry",
    "Grapes",
    "Lemon",
    "Litchi",
    "Mango",
    "Orange",
    "Papaya",
    "Peach",
    "Pineapple",
    "Pomegranate",
    "Starfruit"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.workspaces_filled),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.clear),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List matchquery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchquery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchquery.length,
      itemBuilder: (context, index) {
        var result = matchquery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List matchquery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchquery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchquery.length,
      itemBuilder: (context, index) {
        var result = matchquery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}

