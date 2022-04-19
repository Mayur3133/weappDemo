import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tab extends StatefulWidget {
  const tab({Key? key}) : super(key: key);

  @override
  State<tab> createState() => _tabState();
}

class _tabState extends State<tab> {
  int pageIndex = 0;

  final pages = [
    Page1(),
    Page2(),
    Page3(),
    Page4(),
    Page5(),
  ];
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBar"),
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    _pageController!.animateToPage(0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  icon: pageIndex == 0
                      ? Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 30,
                        )
                      : Icon(
                          Icons.delete_outline,
                          color: Colors.white,
                          size: 30,
                        ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    _pageController!.animateToPage(1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);

                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  icon: pageIndex == 1
                      ? Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 30,
                        )
                      : Icon(
                          Icons.menu_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    _pageController!.animateToPage(2,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  icon: pageIndex == 2
                      ? Icon(
                          Icons.email,
                          color: Colors.white,
                          size: 30,
                        )
                      : Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    _pageController!.animateToPage(3,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                    setState(() {
                      pageIndex = 3;
                    });
                  },
                  icon: pageIndex == 3
                      ? Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 30,
                        )
                      : Icon(
                          Icons.send_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    _pageController!.animateToPage(4,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                    setState(() {
                      pageIndex = 4;
                    });
                  },
                  icon: pageIndex == 4
                      ? Icon(
                          Icons.add_a_photo_rounded,
                          color: Colors.white,
                          size: 30,
                        )
                      : Icon(
                          Icons.add_a_photo_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                ),
              ],
            ),
          ),
          Container(
              height: 697,
              color: Colors.blue,
              child:
                  //pages[pageIndex],
                  PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    pageIndex = value;
                  });
                },
                children: [Page1(), Page2(), Page3(), Page4(), Page5()],
              )),
        ],
      ),
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

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          "5",
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
