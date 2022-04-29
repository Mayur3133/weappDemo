import 'dart:io';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class videoplyscreen extends StatefulWidget {
  final Future<File?> file;

  const videoplyscreen({Key? key, required this.file}) : super(key: key);

  @override
  State<videoplyscreen> createState() => _videoplyscreenState();
}

class _videoplyscreenState extends State<videoplyscreen> {
  VideoPlayerController? videocontroller;
  bool initialized = false;
  bool tap = true;

  @override
  void initState() {
    initvideo();
    super.initState();
  }

  @override
  void dispose() {
    videocontroller!.dispose();
    super.dispose();
  }


  initvideo() async {
    final video = await widget.file;
    videocontroller = VideoPlayerController.file(video!);
    videocontroller!.addListener(
      () {
        setState(
          () {},
        );
      },
    );
    videocontroller!.removeListener(
      () {
        setState(
          () {},
        );
      },
    );
    videocontroller!.setLooping(true);
    videocontroller!.initialize().then((value) => setState(() {}));
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
                      child: Stack(
                        children: [
                          VideoPlayer(videocontroller!),
                          GestureDetector(
                            onTap: () {
                              if (tap) {
                                tap = false;
                                setState(() {});
                              } else {
                                tap = true;
                                setState(() {});
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                final durationState =
                                                    snapshot.data;
                                                final progress =
                                                    videocontroller!
                                                        .value.position;
                                                final total = videocontroller!
                                                    .value.duration;
                                                return ProgressBar(
                                                  progress: progress,
                                                  total: total,
                                                  barHeight: 2,
                                                  barCapShape:
                                                      BarCapShape.square,
                                                  baseBarColor: Colors.white,
                                                  progressBarColor: Colors.blue,
                                                  thumbColor: Colors.white60
                                                      .withBlue(99),
                                                  timeLabelTextStyle: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                  onSeek: (duration) {
                                                    videocontroller!
                                                        .seekTo(duration);
                                                  },
                                                );
                                              },
                                            ),
                                          ),

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                color: Colors.white,
                                                onPressed: () {
                                                  Duration currentPosition =
                                                      videocontroller!
                                                          .value.position;
                                                  Duration targetPosition =
                                                      currentPosition -
                                                          Duration(seconds: 10);
                                                  videocontroller!
                                                      .seekTo(targetPosition);

                                                  setState(() {});
                                                },
                                                icon: Icon(
                                                    Icons.rotate_left_outlined),
                                              ),
                                              IconButton(
                                                color: Colors.white,
                                                onPressed: () {

                                                  setState(() {});
                                                },
                                                icon: Icon(Icons.skip_previous),
                                              ),
                                              IconButton(
                                                color: Colors.white,
                                                onPressed: () {
                                                  setState(() {
                                                    videocontroller!
                                                            .value.isPlaying
                                                        ? videocontroller!
                                                            .pause()
                                                        : videocontroller!
                                                            .play();
                                                  });
                                                },
                                                icon: Icon(
                                                  videocontroller!
                                                          .value.isPlaying
                                                      ? Icons.pause
                                                      : Icons.play_arrow,
                                                ),
                                              ),
                                              IconButton(
                                                color: Colors.white,
                                                onPressed: () {
                                                  setState(() {});
                                                },
                                                icon: Icon(
                                                  Icons.skip_next,
                                                ),
                                              ),
                                              IconButton(
                                                color: Colors.white,
                                                onPressed: () {
                                                  Duration currentPosition =
                                                      videocontroller!
                                                          .value.position;
                                                  Duration targetPosition =
                                                      currentPosition +
                                                          Duration(seconds: 10);
                                                  videocontroller!
                                                      .seekTo(targetPosition);

                                                  setState(() {});
                                                },
                                                icon: Icon(Icons
                                                    .rotate_right_outlined),
                                              ),
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
                    )
                  : Container(
                      child: Text(
                        widget.file.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class DurationState {
  DurationState({this.position = Duration.zero, this.total = Duration.zero});

  Duration position, total;
}
