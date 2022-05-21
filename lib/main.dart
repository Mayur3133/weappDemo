import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertask/homepage.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  Stripe.publishableKey =
      "pk_test_51KxjzaSCwVxg8MzfxvAXbttahWOqeYCRlc71pGCnhv0zyBR0CGZIDpqRVa0tDNFPkHa23WZzTsMnDnclMKnRs35E00USnYzX4q";
  // await Stripe.instance.applySettings();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: homepage(),
    debugShowCheckedModeBanner: false,
  ));
}
