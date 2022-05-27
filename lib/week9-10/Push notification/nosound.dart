import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class nosound extends StatefulWidget {
  @override
  _nosoundState createState() => _nosoundState();
}

class _nosoundState extends State<nosound> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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

  Future<void> displayingnosoundNotification() async {
    var androidDetail = AndroidNotificationDetails(
      "id",
      "name",
      importance: Importance.high,
      playSound: false,
      priority: Priority.high,
      showWhen: false,
    );
    var iosDetail = IOSNotificationDetails();
    final allDetail =
        NotificationDetails(android: androidDetail, iOS: iosDetail);
    await fP.show(0, "Flutter", "Hello", allDetail,
        payload: "first notifications");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                displayingnosoundNotification();
              },
              child: Text("Notification With sound"),
            ),
          ],
        ),
      ),
    );
  }
}
