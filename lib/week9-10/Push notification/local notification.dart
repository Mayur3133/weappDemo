import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../main.dart';
import 'nosound.dart';
import 'push notification.dart';

class localnoti extends StatefulWidget {
  @override
  _localnotiState createState() => _localnotiState();
}

class _localnotiState extends State<localnoti> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        print('A new onMessageOpenedApp event was published!');
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text(notification.title!),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(notification.body!)],
                    ),
                  ),
                );
              });
        }
      },
    );

    initialisation();
  }

  var fP = FlutterLocalNotificationsPlugin();

  Future<void> initialisation() async {
    var androidSetup = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosSetup = IOSInitializationSettings();
    final setupNotification =
        InitializationSettings(android: androidSetup, iOS: iosSetup);
    await fP.initialize(setupNotification,
        onSelectNotification: selectNotification);
  }

  Future<void> selectNotification(String? payload) async {
    if (payload != null) {
      print(payload);
    }
  }

  Future<void> displayingNotification() async {
    var androidDetail = AndroidNotificationDetails("id", "name",
        importance: Importance.high,
        playSound: true,
        priority: Priority.high,
        showWhen: false,
        largeIcon: DrawableResourceAndroidBitmap('ic_launcher'));
    var iosDetail = IOSNotificationDetails();
    final allDetail =
        NotificationDetails(android: androidDetail, iOS: iosDetail);
    await fP.show(0, "Flutter", "Hello", allDetail,
        payload: "first notifications");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local Notification"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                displayingNotification();
              },
              child: Text("   Notification With sound   "),
            ),
            ElevatedButton(
              onPressed: () {
                notificationwithprogress();
              },
              child: Text(" Notification With Progress"),
            ),
            ElevatedButton(
              onPressed: () {
                scheduleNotification();
              },
              child: Text("Show schedule Notification"),
            ),
            ElevatedButton(
              onPressed: () {
                notificationwithimage();
              },
              child: Text(" show Notification With Img"),
            ),
            ElevatedButton(
              onPressed: () {
                _showNotificationWithoutSound();
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) {
                //     return nosound();
                //   },
                // ));
              },
              child: Text(" Notification Without sound  "),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> scheduleNotification() async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 10));
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'id',
      'name',
      largeIcon: DrawableResourceAndroidBitmap('ic_launcher'),
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'scheduled title',
        'scheduled body',
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }

  Future<void> notificationwithprogress() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'indeterminate progress channel',
      'indeterminate progress channel',
      channelShowBadge: false,
      importance: Importance.max,
      priority: Priority.high,
      onlyAlertOnce: true,
      showProgress: true,
      indeterminate: true,
    );
    const IOSNotificationDetails iOSPlatformChannelSpecifics =
        IOSNotificationDetails(sound: 'slow_spring_board.aiff');
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0,
        'indeterminate progress notification title',
        'indeterminate progress notification body',
        platformChannelSpecifics,
        payload: 'item x');
  }

  Future<void> notificationwithimage() async {
    var bigPictureStyleInformation = BigPictureStyleInformation(
        DrawableResourceAndroidBitmap("ic_launcher"),
        largeIcon: DrawableResourceAndroidBitmap("ic_launcher"),
        contentTitle: 'Image Notification',
        htmlFormatContentTitle: true,
        summaryText: 'big image notifications',
        htmlFormatSummaryText: true);

    var android = AndroidNotificationDetails(
      'id',
      'channel',
      styleInformation: bigPictureStyleInformation,
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'Image', 'Local Notification With Image', platform,
        payload: 'big image notifications');
  }

  Future _showNotificationWithoutSound() async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name',
        playSound: false, importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics =
    new IOSNotificationDetails(presentSound: false);
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'New Post',
      'How to Show Notification in Flutter',
      platformChannelSpecifics,
      payload: 'No_Sound',
    );
  }
}
