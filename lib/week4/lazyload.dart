import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class lazyload extends StatefulWidget {
  const lazyload({Key? key}) : super(key: key);

  @override
  State<lazyload> createState() => _lazyloadState();
}

class _lazyloadState extends State<lazyload> {
  List data = [];
  int curntlength = 0;
  final incremnet = 10;
  bool isloading = false;

  @override
  void initState() {
    super.initState();
    load_data();
  }

  Future load_data() async {
    if (!isloading) {
      setState(() {
        isloading = true;
      });

      await new Future.delayed(Duration(seconds: 1));
      for (var i = curntlength; i <= curntlength + incremnet; i++) {
        data.add(i);
      }

      setState(() {
        isloading = false;
        curntlength = data.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LazyLoadScrollView(
          isLoading: isloading,
          onEndOfPage: () => load_data(),
          child: ListView.builder(
              itemCount: data.length + 1,
              itemBuilder: (context, position) {
                if (position == data.length) {
                  return _buildProgressIndicator();
                } else {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 60.0,
                                width: 50.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage("image/img.jpg"),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(" Count $position \n Hello How are you?"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
              })),
    );
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: isloading ? 1.0 : 00,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
