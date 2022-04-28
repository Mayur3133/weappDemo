import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';

class recordingapp extends StatefulWidget {
  const recordingapp({Key? key}) : super(key: key);

  @override
  State<recordingapp> createState() => _recordingappState();
}

class _recordingappState extends State<recordingapp> {
  String statusText = "";
  bool isComplete = false;
  bool status = true;
  Timer? timer;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    stopRecord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_printDuration(Duration(seconds: count)),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30,
            ),
            Container(
              child: status
                  ? IconButton(
                      onPressed: () async {
                        abc();
                        startRecord();
                        setState(() {
                          status = false;
                          print(status);
                        });
                      },
                      icon: Icon(
                        Icons.mic_none_rounded,
                      ))
                  : InkWell(
                      onTap: () {
                        stopRecord();
                        setState(() {
                          status = true;
                          print(status);
                        });
                      },
                      child: Container(
                        //   color: Colors.black26,
                        child: Icon(Icons.pause),
                        //  color: Colors.black,
                        height: 50,
                        width: 60,
                      ),
                    ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(color: Colors.blue.shade300),
                child: Center(
                  child: Text(
                    RecordMp3.instance.status == RecordStatus.PAUSE
                        ? 'resume'
                        : 'pause',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                pauseRecord();
              },
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    if (twoDigits(duration.inHours) != "00") {
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    } else if (twoDigits(duration.inHours) == "00") {
      if (twoDigitMinutes != "00") {
        return "$twoDigitMinutes:$twoDigitSeconds";
      } else {
        return twoDigitSeconds;
      }
    } else {
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    }
  }

  int count = 0;
  var str = 0;
  var endtime = 0;

  abc() {
    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(() {
          count++;
        });
      },
    );
  }

  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  void startRecord() async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      statusText = "Recording...";
      recordFilePath = await getFilePath();
      isComplete = false;
      RecordMp3.instance.start(recordFilePath, (type) {
        statusText = "record error--->$type";
        setState(() {});
      });
    } else {
      statusText = "not microphone permission ";
    }
    setState(() {});
  }

  void pauseRecord() {
    timer!.cancel();
    if (RecordMp3.instance.status == RecordStatus.PAUSE) {
      bool s = RecordMp3.instance.resume();
      if (s) {
        statusText = "Recording...";
        setState(() {
          abc();
        });
      }
    } else {
      bool s = RecordMp3.instance.pause();
      if (s) {
        statusText = "Recording pause...";
        setState(() {});
      }
    }
  }

  void stopRecord() {
    bool s = RecordMp3.instance.stop();
    if (s) {
      statusText = "Record complete";
      isComplete = true;
      setState(() {
        timer!.cancel();
        count = 0;
      });
    }
  }

  void resumeRecord() {
    timer!.cancel();
    bool s = RecordMp3.instance.resume();
    if (s) {
      statusText = "Recording...";
      setState(() {});
    }
  }

  late String recordFilePath;

  void play() {
    if (recordFilePath != null && File(recordFilePath).existsSync()) {
      AudioPlayer audioPlayer = AudioPlayer();
      audioPlayer.play(recordFilePath, isLocal: true);
    }
  }

  int i = 0;

  Future<String> getFilePath() async {
    Directory? storageDirectory = await getExternalStorageDirectory();
    String sdPath = storageDirectory!.path + "/record";
    print(sdPath);
    var d = Directory("storage/emulated/0/Music");
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return "storage/emulated/0/Music" +
        "/test_${i++}${DateTime.now().millisecondsSinceEpoch}.mp3";
  }
}
