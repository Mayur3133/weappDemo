import 'dart:developer';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertask/Week7/Camera/previewscreen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import '../../main.dart';
import '../videopage.dart';

class cam extends StatefulWidget {
  @override
  _camState createState() => _camState();
}

class _camState extends State<cam> with WidgetsBindingObserver {
  CameraController? controller;
  VideoPlayerController? videoController;

  st() {
    if (mounted) {
      setState(() {});
    }
  }

  File? photofl;
  File? vidfl;

  // Initial values
  bool _isCameraInitialized = false;
  bool _isCameraPermissionGranted = false;
  bool _isRearCameraSelected = true;
  bool _isVideoCameraSelected = false;
  bool _isRecordingInProgress = false;
  bool _isrecording = false;
  double minzoom = 1.0;
  double maxzoom = 1.0;

  // Current values
  double _currentZoomLevel = 1.0;
  FlashMode? _currentFlashMode;

  List<File> allFileList = [];

  final resolutionPresets = ResolutionPreset.values;

  ResolutionPreset currentResolutionPreset = ResolutionPreset.high;

  getPermissionStatus() async {
    await Permission.camera.request();
    var status = await Permission.camera.status;

    if (status.isGranted) {
      log('Camera Permission: GRANTED');
      setState(() {
        _isCameraPermissionGranted = true;
      });
      // Set and initialize the new camera
      onNewCameraSelected(cameras[0]);
      refreshAlreadyCapturedImages();
    } else {
      log('Camera Permission: DENIED');
    }
  }

  refreshAlreadyCapturedImages() async {
    final directory = await getApplicationDocumentsDirectory();
    List<FileSystemEntity> fileList = await directory.list().toList();
    allFileList.clear();
    List<Map<int, dynamic>> fileNames = [];

    fileList.forEach((file) {
      if (file.path.contains('.jpg') || file.path.contains('.mp4')) {
        allFileList.add(File(file.path));

        String name = file.path.split('/').last.split('.').first;
        fileNames.add({0: int.parse(name), 1: file.path.split('/').last});
      }
    });

    if (fileNames.isNotEmpty) {
      final recentFile =
          fileNames.reduce((curr, next) => curr[0] > next[0] ? curr : next);
      String recentFileName = recentFile[1];
      if (recentFileName.contains('.mp4')) {
        vidfl = File('${directory.path}/$recentFileName');
        print('Video file---------${vidfl}');
        photofl = null;
        //_startVideoPlayer();

      } else {
        photofl = File('${directory.path}/$recentFileName');
        print('Photo file---------${photofl}');

        vidfl = null;
      }

      st();
    }
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;

    if (cameraController!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      print('Error occured while taking picture: $e');
      return null;
    }
  }

  Future<void> _startVideoPlayer() async {
    if (vidfl != null) {
      videoController = VideoPlayerController.file(vidfl!);
      await videoController!.initialize().then((_) {
        st();
      });
      await videoController!.setLooping(true);
      await videoController!.play();
    }
  }

  Future<void> startVideoRecording() async {
    final CameraController? cameraController = controller;

    if (controller!.value.isRecordingVideo) {
      // A recording has already started, do nothing.
      return;
    }

    try {
      await cameraController!.startVideoRecording();
      _isRecordingInProgress = true;
      print(_isRecordingInProgress);
      st();
    } on CameraException catch (e) {
      print('Error starting to record video: $e');
    }
  }

  Future<XFile?> stopVideoRecording() async {
    if (controller!.value.isRecordingVideo) {
      // Recording is already is stopped state
      return null;
    }

    try {
      XFile file = await controller!.stopVideoRecording();
      _isRecordingInProgress = false;
      st();
      return file;
    } on CameraException catch (e) {
      print('Error stopping video recording: $e');
      return null;
    }
  }

  Future<void> pauseVideoRecording() async {
    if (!controller!.value.isRecordingVideo) {
      // Video recording is not in progress
      return;
    }

    try {
      await controller!.pauseVideoRecording();
    } on CameraException catch (e) {
      print('Error pausing video recording: $e');
    }
  }

  Future<void> resumeVideoRecording() async {
    if (!controller!.value.isRecordingVideo) {
      // No video recording was in progress
      return;
    }

    try {
      await controller!.resumeVideoRecording();
    } on CameraException catch (e) {
      print('Error resuming video recording: $e');
    }
  }

  void resetCameraValues() async {
    _currentZoomLevel = 1.0;
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;

    final CameraController cameraController = CameraController(
      cameraDescription,
      currentResolutionPreset,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    await previousCameraController?.dispose();

    resetCameraValues();

    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    try {
      await cameraController.initialize();
      await Future.wait([
        cameraController.getMaxZoomLevel().then((value) => maxzoom = value),
        cameraController.getMinZoomLevel().then((value) => minzoom = value),
      ]);

      _currentFlashMode = controller!.value.flashMode;
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }

    if (mounted) {
      setState(() {
        _isCameraInitialized = controller!.value.isInitialized;
      });
    }
  }

  void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    if (controller == null) {
      return;
    }

    final offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    controller!.setExposurePoint(offset);
    controller!.setFocusPoint(offset);
  }

  @override
  void initState() {
    // Hide the status bar in Android
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    getPermissionStatus();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected(cameraController.description);
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    videoController?.dispose();
    super.dispose();
  }

  // _recordVideo() async {
  //   if (_isrecording) {
  //     final file = await controller!.stopVideoRecording();
  //     setState(() => _isrecording = false);
  //     final route = MaterialPageRoute(
  //       fullscreenDialog: true,
  //       builder: (_) => VideoPage(filePath: file.path),
  //     );
  //     Navigator.push(context, route);
  //   } else {
  //     await controller!.prepareForVideoRecording();
  //     await controller!.startVideoRecording();
  //     setState(() => _isrecording = true);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: _isCameraPermissionGranted
            ? _isCameraInitialized
                ? Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1 / controller!.value.aspectRatio,
                        child: Stack(
                          children: [
                            CameraPreview(
                              controller!,
                              child: LayoutBuilder(builder:
                                  (BuildContext context,
                                      BoxConstraints constraints) {
                                return GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTapDown: (details) =>
                                      onViewFinderTap(details, constraints),
                                );
                              }),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    setState(() {
                                      _currentFlashMode = FlashMode.off;
                                    });
                                    await controller!.setFlashMode(
                                      FlashMode.off,
                                    );
                                  },
                                  child: Icon(
                                    Icons.flash_off,
                                    color: _currentFlashMode == FlashMode.off
                                        ? Colors.amber
                                        : Colors.white,
                                  ),
                                ),
                                SizedBox(width: 80),
                                InkWell(
                                  onTap: () async {
                                    setState(() {
                                      _currentFlashMode = FlashMode.always;
                                    });
                                    await controller!.setFlashMode(
                                      FlashMode.always,
                                    );
                                  },
                                  child: Icon(
                                    Icons.flash_on,
                                    color: _currentFlashMode == FlashMode.always
                                        ? Colors.amber
                                        : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                16.0,
                                8.0,
                                16.0,
                                8.0,
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: RotatedBox(
                                        quarterTurns: 3,
                                        child: Container(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  RotatedBox(
                                                    quarterTurns: 1,
                                                    child: Text(
                                                      _currentZoomLevel
                                                              .toStringAsFixed(
                                                                  1) +
                                                          'x',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: IntrinsicWidth(
                                                      stepWidth: 300,
                                                      child: Slider(
                                                        value:
                                                            _currentZoomLevel,
                                                        min: minzoom,
                                                        max: maxzoom,
                                                        activeColor:
                                                            Colors.white,
                                                        inactiveColor:
                                                            Colors.white30,
                                                        onChanged:
                                                            (value) async {
                                                          setState(() {
                                                            _currentZoomLevel =
                                                                value;
                                                          });
                                                          await controller!
                                                              .setZoomLevel(
                                                                  value);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        // onTap: ()async {
                                        //   _isRecordingInProgress ?  controller!
                                        //       .value.isRecordingPaused
                                        //     ? await resumeVideoRecording() :
                                        //   await pauseVideoRecording()
                                        //       :
                                        //   // setState(() {
                                        //   //   _isCameraInitialized = false;
                                        //   //       });
                                        //   onNewCameraSelected(cameras[
                                        //       _isRearCameraSelected ? 1 : 0]);
                                        //   setState(() {
                                        //     _isRearCameraSelected =
                                        //         !_isRearCameraSelected;
                                        //   });
                                        // },

                                        onTap: _isRecordingInProgress
                                            ? () async {
                                                if (controller!
                                                    .value.isRecordingPaused) {
                                                  await resumeVideoRecording();
                                                } else {
                                                  await pauseVideoRecording();
                                                }
                                              }
                                            : () {
                                                setState(() {
                                                  _isCameraInitialized = false;
                                                });
                                                onNewCameraSelected(cameras[
                                                    _isRearCameraSelected
                                                        ? 1
                                                        : 0]);
                                                setState(() {
                                                  _isRearCameraSelected =
                                                      !_isRearCameraSelected;
                                                });
                                              },
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Icon(
                                              Icons.circle,
                                              color: Colors.black38,
                                              size: 60,
                                            ),
                                            _isRecordingInProgress
                                                ? controller!
                                                        .value.isRecordingPaused
                                                    ? Icon(
                                                        Icons.play_arrow,
                                                        color: Colors.white,
                                                        size: 30,
                                                      )
                                                    : Icon(
                                                        Icons.pause,
                                                        color: Colors.white,
                                                        size: 30,
                                                      )
                                                : Icon(
                                                    _isRearCameraSelected
                                                        ? Icons
                                                            .rotate_90_degrees_ccw
                                                        : Icons
                                                            .rotate_90_degrees_ccw,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                          ],
                                        ),
                                      ),
                                      // Stack(
                                      //   alignment: Alignment.bottomCenter,
                                      //   children: [
                                      //     CameraPreview(controller!),
                                      //     Padding(
                                      //       padding: const EdgeInsets.all(25),
                                      //       child: FloatingActionButton(
                                      //         backgroundColor: Colors.red,
                                      //         child: Icon(_isrecording
                                      //             ? Icons.stop
                                      //             : Icons.circle),
                                      //         onPressed: () => _recordVideo(),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),

                                      InkWell(
                                        onTap: _isVideoCameraSelected
                                            ? () async {
                                                if (_isRecordingInProgress) {
                                                  XFile? rawVideo =
                                                      await stopVideoRecording();
                                                  File videoFile =
                                                      File(rawVideo!.path);

                                                  int currentUnix = DateTime
                                                          .now()
                                                      .millisecondsSinceEpoch;

                                                  final directory =
                                                      await getApplicationDocumentsDirectory();

                                                  String fileFormat = videoFile
                                                      .path
                                                      .split('.')
                                                      .last;

                                                  vidfl = await videoFile.copy(
                                                    '${directory.path}/$currentUnix.$fileFormat',
                                                  );
                                                  _isRecordingInProgress =
                                                      false;

                                                  _startVideoPlayer();
                                                } else {
                                                  await startVideoRecording();
                                                  //time();
                                                  // setState(() {});
                                                }
                                              }
                                            : () async {
                                                XFile? rawImage =
                                                    await takePicture();
                                                File imageFile =
                                                    File(rawImage!.path);

                                                int currentUnix = DateTime.now()
                                                    .millisecondsSinceEpoch;

                                                final directory =
                                                    await getApplicationDocumentsDirectory();

                                                String fileFormat = imageFile
                                                    .path
                                                    .split('.')
                                                    .last;

                                                print(
                                                    ">>>>>>>>>${rawImage.path}");

                                                print(fileFormat);

                                                await imageFile.copy(
                                                  '${directory.path}/$currentUnix.$fileFormat',
                                                );

                                                refreshAlreadyCapturedImages();
                                              },
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Icon(
                                              Icons.radio_button_off,
                                              color: _isVideoCameraSelected
                                                  ? Colors.white
                                                  : Colors.white,
                                              size: 80,
                                            ),
                                            Icon(
                                              Icons.circle,
                                              color: _isVideoCameraSelected
                                                  ? Colors.red
                                                  : Colors.transparent,
                                              size: 65,
                                            ),
                                            _isVideoCameraSelected &&
                                                    _isRecordingInProgress
                                                ? Icon(
                                                    Icons.stop_rounded,
                                                    color: Colors.white,
                                                    size: 32,
                                                  )
                                                : Container(),
                                          ],
                                        ),
                                      ),

                                      InkWell(
                                        onTap: photofl != null || vidfl != null
                                            ? () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        glrscn(
                                                      imageFile: photofl!,
                                                      fileList: allFileList,
                                                    ),
                                                  ),
                                                );
                                              }
                                            : null,
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                            image: photofl != null
                                                ? DecorationImage(
                                                    image: FileImage(photofl!),
                                                    fit: BoxFit.cover,
                                                  )
                                                : null,
                                          ),
                                          child: vidfl != null
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: AspectRatio(
                                                    aspectRatio:
                                                        videoController!
                                                            .value.aspectRatio,
                                                    child: VideoPlayer(
                                                        videoController!),
                                                  ),
                                                )
                                              : Container(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8.0,
                                          right: 4.0,
                                        ),
                                        child: TextButton(
                                            onPressed: () {
                                              if (_isVideoCameraSelected) {
                                                setState(() {
                                                  _isVideoCameraSelected =
                                                      false;
                                                });
                                              }
                                            },
                                            style: TextButton.styleFrom(
                                              // shape: RoundedRectangleBorder(
                                              //     borderRadius:
                                              //         BorderRadius.circular(50)),
                                              primary: _isVideoCameraSelected
                                                  ? Colors.white
                                                  : Colors.blue,
                                              // backgroundColor:
                                            ),
                                            // child: _isVideoCameraSelected
                                            //     ? Text('Photo',
                                            //         style: TextStyle(
                                            //             color: Colors.white))
                                            //     : Text('Photo',
                                            //         style: TextStyle(
                                            //             color: Colors.grey)),
                                            child: Text("photo")),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 4.0, right: 8.0),
                                        child: TextButton(
                                            onPressed: () {
                                              if (!_isVideoCameraSelected) {
                                                setState(() {
                                                  _isVideoCameraSelected = true;
                                                });
                                              }
                                            },
                                            style: TextButton.styleFrom(
                                              primary: _isVideoCameraSelected
                                                  ? Colors.blue
                                                  : Colors.white,
                                            ),
                                            child: Text("video")
                                            // child: _isVideoCameraSelected
                                            //     ? Text('VIDEO',
                                            //         style: TextStyle(
                                            //             color: Colors.white))
                                            //     : Text('VIDEO',
                                            //         style: TextStyle(
                                            //             color: Colors.grey)),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                      'LOADING',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(),
                  Text(
                    'Permission denied',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      getPermissionStatus();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Give permission',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
