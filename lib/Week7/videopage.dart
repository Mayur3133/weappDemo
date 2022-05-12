import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class recordingpage extends StatefulWidget {
  final String filePath;

  const recordingpage({Key? key, required this.filePath}) : super(key: key);

  @override
  _recordingpageState createState() => _recordingpageState();
}

class _recordingpageState extends State<recordingpage> {
   VideoPlayerController? videocontroller;

  @override
  void dispose() {
    videocontroller!.dispose();
    super.dispose();
  }

  Future _initVideoPlayer() async {
    videocontroller = VideoPlayerController.file(File(widget.filePath));
    await videocontroller!.initialize();
    await videocontroller!.setLooping(true);
    await videocontroller!.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // title: const Text('Preview'),
        elevation: 0,
        backgroundColor: Colors.grey,
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.check),
          //   onPressed: () {
          //     //print('do something with the file');
          //   },
          // )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Center(
        child: Container(
          // padding: EdgeInsets.only(top: 50),
          // alignment: Alignment.center,
          width: 500,
          height: 500,
          child: FutureBuilder(
            future: _initVideoPlayer(),
            builder: (context, state) {
              if (state.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return VideoPlayer(videocontroller!);
              }
            },
          ),
        ),
      ),
    );
  }
}
