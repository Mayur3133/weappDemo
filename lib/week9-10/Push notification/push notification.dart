// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'High Importance Notifications', // title
//     importance: Importance.high,
//     playSound: true);
//
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //
//   //   var initialzationSettingsAndroid =
//   //       AndroidInitializationSettings('@mipmap/ic_launcher');
//   //   var initializationSettings =
//   //       InitializationSettings(android: initialzationSettingsAndroid);
//   //
//   //   flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//   //     RemoteNotification? notification = message.notification;
//   //     AndroidNotification? android = message.notification?.android;
//   //     if (notification != null && android != null) {
//   //       flutterLocalNotificationsPlugin.show(
//   //           notification.hashCode,
//   //           notification.title,
//   //           notification.body,
//   //           NotificationDetails(
//   //             android: AndroidNotificationDetails(
//   //               channel.id,
//   //               channel.name,
//   //               // icon: android.smallIcon,
//   //             ),
//   //           ));
//   //     }
//   //   });
//   //
//   //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//   //     RemoteNotification? notification = message.notification;
//   //     AndroidNotification? android = message.notification?.android;
//   //     if (notification != null && android != null) {
//   //       flutterLocalNotificationsPlugin.show(
//   //           notification.hashCode,
//   //           notification.title,
//   //           notification.body,
//   //           NotificationDetails(
//   //             android: AndroidNotificationDetails(
//   //               channel.id,
//   //               channel.name,
//   //               color: Colors.blue,
//   //               playSound: true,
//   //               icon: '@mipmap/ic_launcher',
//   //             ),
//   //           ));
//   //     }
//   //   });
//   //
//   //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//   //     print('A new onMessageOpenedApp event was published!');
//   //     RemoteNotification? notification = message.notification;
//   //     AndroidNotification? android = message.notification?.android;
//   //     if (notification != null && android != null) {
//   //       showDialog(
//   //           context: context,
//   //           builder: (_) {
//   //             return AlertDialog(
//   //               title: Text(notification.title!),
//   //               content: SingleChildScrollView(
//   //                 child: Column(
//   //                   crossAxisAlignment: CrossAxisAlignment.start,
//   //                   children: [Text(notification.body!)],
//   //                 ),
//   //               ),
//   //             );
//   //           });
//   //     }
//   //   });
//   // }
//   //
//
//   Future<void> showNotification() async {
//     setState(() {
//       _counter++;
//     });
//     flutterLocalNotificationsPlugin.show(
//         0,
//         "Testing $_counter",
//         "How you doin ?",
//         NotificationDetails(
//             android: AndroidNotificationDetails(channel.id, channel.name,
//                 importance: Importance.high,
//                 color: Colors.blue,
//                 playSound: true,
//                 icon: '@mipmap/ic_launcher')));
//     String? token = await FirebaseMessaging.instance.getToken();
//     print(token); // Print the Token in Console
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Push Notification"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(onPressed: showNotification, child: Text("Press")),
//             // Text(
//             //   'You have pushed the button this many times:',
//             // ),
//             // Text(
//             //   '$_counter',
//             //   style: Theme.of(context).textTheme.headline4,
//             // ),
//           ],
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: showNotification,
//       //   tooltip: 'Increment',
//       //   child: Icon(Icons.add),
//       // ),
//     );
//   }
// }
