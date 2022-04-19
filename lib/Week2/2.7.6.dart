// import 'package:flutter/material.dart';
//
// class bottomtab extends StatefulWidget {
//   const bottomtab({Key? key}) : super(key: key);
//
//   @override
//   State<bottomtab> createState() => _bottomtabState();
// }
//
// class _bottomtabState extends State<bottomtab> {
//   int pageIndex = 0;
//
//   final pages = [
//     const Page1(),
//     const Page2(),
//     const Page3(),
//     const Page4(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffC4DFCB),
//       appBar: AppBar(
//         title: Text("Bottom Bar"),
//       ),
//       body: pages[pageIndex],
//       bottomNavigationBar: bottombar(context),
//     );
//   }
//
//   bottombar(BuildContext context) {
//     return Container(
//       height: 60,
//       decoration: BoxDecoration(
//         color: Theme.of(context).primaryColor,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           IconButton(
//             enableFeedback: false,
//             onPressed: () {
//               setState(() {
//                 pageIndex = 0;
//               });
//             },
//             icon: pageIndex == 0
//                 ? const Icon(
//                     Icons.home_filled,
//                     color: Colors.white,
//                     size: 35,
//                   )
//                 : const Icon(
//                     Icons.home_outlined,
//                     color: Colors.white,
//                     size: 35,
//                   ),
//           ),
//           IconButton(
//             enableFeedback: false,
//             onPressed: () {
//               setState(() {
//                 pageIndex = 1;
//               });
//             },
//             icon: pageIndex == 1
//                 ? const Icon(
//                     Icons.work_rounded,
//                     color: Colors.white,
//                     size: 35,
//                   )
//                 : const Icon(
//                     Icons.work_outline_outlined,
//                     color: Colors.white,
//                     size: 35,
//                   ),
//           ),
//           IconButton(
//             enableFeedback: false,
//             onPressed: () {
//               setState(() {
//                 pageIndex = 2;
//               });
//             },
//             icon: pageIndex == 2
//                 ? const Icon(
//                     Icons.widgets_rounded,
//                     color: Colors.white,
//                     size: 35,
//                   )
//                 : const Icon(
//                     Icons.widgets_outlined,
//                     color: Colors.white,
//                     size: 35,
//                   ),
//           ),
//           IconButton(
//             enableFeedback: false,
//             onPressed: () {
//               setState(() {
//                 pageIndex = 3;
//               });
//             },
//             icon: pageIndex == 3
//                 ? const Icon(
//                     Icons.person,
//                     color: Colors.white,
//                     size: 35,
//                   )
//                 : const Icon(
//                     Icons.person_outline,
//                     color: Colors.white,
//                     size: 35,
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class bottomtab extends StatefulWidget {
  const bottomtab({Key? key}) : super(key: key);

  @override
  State<bottomtab> createState() => _bottomtabState();
}

class _bottomtabState extends State<bottomtab> {
  int pageIndex = 0;

  final pages = [
     Page1(),
     Page2(),
     Page3(),
     Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomTab"),
      ),
      body: Container(
          child: Column(
        children: [
          Container(
            child: pages[pageIndex],
            height: 697,
            color: Colors.blue,
          ),
          Container(
            height: 60,
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          enableFeedback: false,
                          onPressed: () {
                            setState(() {
                              pageIndex = 0;
                            });
                          },
                          icon: pageIndex == 0
                              ? Icon(
                                  Icons.home_filled,
                                  color: Colors.white,
                                  size: 30,
                                )
                              : Icon(
                                  Icons.home_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                        ),
                        IconButton(
                          enableFeedback: false,
                          onPressed: () {
                            setState(() {
                              pageIndex = 1;
                            });
                          },
                          icon: pageIndex == 1
                              ? Icon(
                                  Icons.work_rounded,
                                  color: Colors.white,
                                  size: 30,
                                )
                              : Icon(
                                  Icons.work_outline_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                        ),
                        IconButton(
                          enableFeedback: false,
                          onPressed: () {
                            setState(() {
                              pageIndex = 2;
                            });
                          },
                          icon: pageIndex == 2
                              ? Icon(
                                  Icons.widgets_rounded,
                                  color: Colors.white,
                                  size: 30,
                                )
                              : Icon(
                                  Icons.widgets_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                        ),
                        IconButton(
                          enableFeedback: false,
                          onPressed: () {
                            setState(() {
                              pageIndex = 3;
                            });
                          },
                          icon: pageIndex == 3
                              ? Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 30,
                                )
                              : Icon(
                                  Icons.person_outline,
                                  color: Colors.white,
                                  size: 30,
                                ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          "1",
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          "2",
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          "3",
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          "4",
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
