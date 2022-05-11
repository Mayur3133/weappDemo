import 'dart:developer';
import 'dart:io';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_player/video_player.dart';

class videoplyscreen extends StatefulWidget {
  List<AssetEntity> assets = [];
  var curnt;

  videoplyscreen({Key? key, required this.assets, this.curnt})
      : super(key: key);

  @override
  State<videoplyscreen> createState() => _videoplyscreenState();
}

class _videoplyscreenState extends State<videoplyscreen> {
  VideoPlayerController? videocontroller;
  bool initialized = false;
  bool tap = true;
  bool fullscreen = true;

  int ind = 0;

  abc() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    initvideo(0);
    super.initState();
  }

  @override
  void deactivate() {
    videocontroller!.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    videocontroller!.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  initvideo(int ind) async {
    final video = await widget.assets[widget.curnt + ind].file;
    videocontroller = VideoPlayerController.file(video!);
    abc();
    videocontroller!.addListener(
      () {
        abc();
      },
    );
    videocontroller!.removeListener(
      () {
        abc();
      },
    );
    videocontroller!.setLooping(true);
    videocontroller!.initialize().then((value) => abc());
    videocontroller!.play();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: videocontroller!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: videocontroller!.value.aspectRatio,
                      child: VideoPlayer(videocontroller!),
                    )
                  : Container(
                      // child: Text(
                      //   widget.file.toString(),
                      //   style: TextStyle(color: Colors.white),
                      // ),
                      ),
            ),
            GestureDetector(
              onTap: () {
                if (tap) {
                  tap = false;
                  abc();
                } else {
                  tap = true;
                  abc();
                }
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
            tap
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        // color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //SizedBox(height:40),
                            Container(
                              // color: Colors.white,
                              height: 10,
                              width: 350,
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.only(bottom: 10),

                              child: StreamBuilder<DurationState>(
                                builder: (context, snapshot) {
                                  final durationState = snapshot.data;
                                  final progress =
                                      videocontroller!.value.position;
                                  final total = videocontroller!.value.duration;
                                  return ProgressBar(
                                    progress: progress,
                                    total: total,
                                    barHeight: 2,
                                    barCapShape: BarCapShape.square,
                                    baseBarColor: Colors.white,
                                    progressBarColor: Colors.blue,
                                    thumbColor: Colors.white60.withBlue(99),
                                    timeLabelTextStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                    onSeek: (duration) {
                                      videocontroller!.seekTo(duration);
                                    },
                                  );
                                },
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    Duration currentPosition =
                                        videocontroller!.value.position;
                                    Duration targetPosition =
                                        currentPosition - Duration(seconds: 10);
                                    videocontroller!.seekTo(targetPosition);

                                    abc();
                                  },
                                  icon: Icon(Icons.rotate_left_outlined),
                                ),
                                IconButton(
                                  color: Colors.white,
                                  onPressed: () async {
                                    if (widget.curnt + ind == 0) {
                                      log("no more previeus videos");
                                      log("${ind}");
                                    } else {
                                      await videocontroller!.dispose();
                                      log("${widget.curnt}");
                                      ind--;
                                      log("${ind}");
                                      log("${widget.curnt + ind}");
                                      await initvideo(ind);
                                    }
                                  },
                                  icon: Icon(Icons.skip_previous),
                                ),
                                IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    videocontroller!.value.isPlaying
                                        ? videocontroller!.pause()
                                        : videocontroller!.play();
                                    abc();
                                  },
                                  icon: Icon(
                                    videocontroller!.value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                  ),
                                ),
                                IconButton(
                                  color: Colors.white,
                                  onPressed: () async {
                                    if (widget.assets.length ==
                                        widget.curnt + ind + 1) {
                                      log("no more next videos");
                                      log("${ind}");
                                    } else {
                                      await videocontroller!.dispose();
                                      ind++;
                                      await initvideo(ind);
                                    }
                                    // playnext();
                                    // abc();
                                  },
                                  icon: Icon(
                                    Icons.skip_next,
                                  ),
                                ),
                                IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    Duration currentPosition =
                                        videocontroller!.value.position;
                                    Duration targetPosition =
                                        currentPosition + Duration(seconds: 10);
                                    videocontroller!.seekTo(targetPosition);

                                    abc();
                                  },
                                  icon: Icon(Icons.rotate_right_outlined),
                                ),
                                if (fullscreen)
                                  IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      SystemChrome.setPreferredOrientations(
                                          [DeviceOrientation.landscapeRight]);
                                      SystemChrome.setEnabledSystemUIMode(
                                          SystemUiMode.leanBack);
                                      fullscreen = false;
                                      abc();
                                    },
                                    icon: Icon(Icons.fullscreen),
                                  )
                                else
                                  IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      SystemChrome.setPreferredOrientations(
                                          [DeviceOrientation.portraitUp]);
                                      SystemChrome.setEnabledSystemUIMode(
                                          SystemUiMode.manual,
                                          overlays: SystemUiOverlay.values);

                                      fullscreen = true;
                                      abc();
                                    },
                                    icon: Icon(Icons.fullscreen_exit),
                                  )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}

class DurationState {
  DurationState({this.position = Duration.zero, this.total = Duration.zero});

  Duration position, total;
}
