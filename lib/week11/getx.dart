import 'package:flutter/cupertino.dart';
import 'package:fluttertask/week11/home.dart';
import 'package:get/get.dart';

class getx extends StatelessWidget {
  const getx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Demo',home: gethomepage(),
    );
  }
}
