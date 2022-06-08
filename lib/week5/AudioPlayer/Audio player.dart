import 'dart:io';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:rxdart/rxdart.dart';

import 'customrecord.dart';

class audioply extends StatefulWidget {
  const audioply({Key? key}) : super(key: key);

  @override
  State<audioply> createState() => _audioplyState();
}

class _audioplyState extends State<audioply> {
  Color? bgcolor = Colors.indigo[300];
  final OnAudioQuery onaudio = OnAudioQuery();

  final AudioPlayer audioplayer = AudioPlayer();

  List<SongModel> songs = [];
  String currentSongTitle = '';
  int currentIndex = 0;
  bool isPlayerViewVisible = false;

  void changePlayerViewVisibility() {
    setState(() {
      isPlayerViewVisible = !isPlayerViewVisible;
    });
  }

  Stream<DurationState> get _durationStateStream =>
      Rx.combineLatest2<Duration, Duration?, DurationState>(
          audioplayer.positionStream,
          audioplayer.durationStream,
          (position, duration) => DurationState(
              position: position, total: duration ?? Duration.zero));

  @override
  void initState() {
    super.initState();
    requestStoragePermission();
    audioplayer.currentIndexStream.listen((index) {
      if (index != null) {
        _updatecurrentsongdetails(index);
      }
    });
  }

  @override
  void dispose() {
    audioplayer.dispose();
    super.dispose();
  }

  Future<void> deleteFile(File file) async {
    try {
      if (await file.exists()) {
        await file.delete();
        print("delete successfully");
      }
    } catch (e) {
      print("delete error");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isPlayerViewVisible) {
      return Scaffold(
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 50, left: 20, right: 20),
            decoration: BoxDecoration(color: bgcolor),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                        child: InkWell(
                      onTap: changePlayerViewVisibility,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.indigo[400], shape: BoxShape.circle),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                    )),
                    Flexible(
                      child: Text(
                        currentSongTitle,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      flex: 5,
                    )
                  ],
                ),
                Container(
                  height: 300,
                  width: 300,
                  decoration:
                      getDecoration(BoxShape.rectangle, Offset(2, 2), 2, 0),
                  margin: EdgeInsets.only(top: 30, bottom: 20),
                  child: QueryArtworkWidget(
                    id: songs[currentIndex].id,
                    type: ArtworkType.AUDIO,
                    // artworkBorder: BorderRadius.circular(200),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 10,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.only(bottom: 10),
                      // decoration: getRectDecoration(
                      //     BorderRadius.circular(20), Offset(2, 2), 2, 0),
                      child: StreamBuilder<DurationState>(
                        stream: _durationStateStream,
                        builder: (context, snapshot) {
                          final durationState = snapshot.data;
                          final progress =
                              durationState?.position ?? Duration.zero;
                          final total = durationState?.total ?? Duration.zero;

                          return ProgressBar(
                            progress: progress,
                            total: total,
                            barHeight: 10,
                            barCapShape: BarCapShape.square,
                            baseBarColor: Colors.black,
                            progressBarColor: Colors.white70,
                            thumbColor: Colors.white60.withBlue(99),
                            timeLabelTextStyle: TextStyle(
                              fontSize: 0,
                            ),
                            onSeek: (duration) {
                              audioplayer.seek(duration);
                            },
                          );
                        },
                      ),
                    ),
                    StreamBuilder<DurationState>(
                        stream: _durationStateStream,
                        builder: (context, snapshot) {
                          final durationState = snapshot.data;
                          final progress =
                              durationState?.position ?? Duration.zero;
                          final total = durationState?.total ?? Duration.zero;

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Text(
                                  progress.toString().split(".")[0],
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  total.toString().split(".")[0],
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                    StreamBuilder<DurationState>(
                        stream: _durationStateStream,
                        builder: (context, snapshot) {
                          final durationState = snapshot.data;
                          final progress =
                              durationState?.position ?? Duration.zero;
                          final total = durationState?.total ?? Duration.zero;

                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                  child: InkWell(
                                onTap: () {
                                  if (audioplayer.hasPrevious) {
                                    audioplayer.seekToPrevious();
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.indigo[400],
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.skip_previous,
                                    color: Colors.white70,
                                  ),
                                ),
                              )),
                              Flexible(
                                  child: InkWell(
                                onTap: () async {
                                  if (audioplayer.position.inSeconds >= 10) {
                                    await audioplayer.seek(Duration(
                                        seconds:
                                            audioplayer.position.inSeconds -
                                                10));
                                  } else {
                                    await audioplayer.seek(Duration.zero);
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.indigo[400],
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.keyboard_double_arrow_left_outlined,
                                    color: Colors.white70,
                                  ),
                                ),
                              )),
                              Flexible(
                                  child: InkWell(
                                onTap: () {
                                  if (audioplayer.playing) {
                                    audioplayer.pause();
                                  } else {
                                    if (audioplayer.currentIndex != null) {
                                      audioplayer.play();
                                    }
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.indigo[400],
                                      shape: BoxShape.circle),
                                  child: StreamBuilder(
                                      stream: audioplayer.playingStream,
                                      builder: (context, snapshot) {
                                        var playinState = snapshot.data as bool;
                                        if (playinState != null &&
                                            playinState) {
                                          return Icon(Icons.pause,
                                              color: Colors.white70, size: 20);
                                        }
                                        return Icon(Icons.play_arrow,
                                            color: Colors.white70, size: 20);
                                      }),
                                ),
                              )),
                              Flexible(
                                  child: InkWell(
                                onTap: () async {
                                  if (audioplayer.position.inSeconds <=
                                      total.inSeconds - 9) {
                                    await audioplayer.seek(Duration(
                                        seconds:
                                            audioplayer.position.inSeconds +
                                                10));
                                  } else {
                                    audioplayer.seekToNext();
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.indigo[400],
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.keyboard_double_arrow_right_outlined,
                                    color: Colors.white70,
                                  ),
                                ),
                              )),
                              Flexible(
                                  child: InkWell(
                                onTap: () {
                                  if (audioplayer.hasNext) {
                                    audioplayer.seekToNext();
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.indigo[400],
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.skip_next,
                                    color: Colors.white70,
                                  ),
                                ),
                              )),
                            ],
                          );
                        }),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.mic, color: Colors.black),
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => recordingapp()));
        },
      ),
      appBar: AppBar(
        title: Text("Audio Player"),
        elevation: 20,
        // backgroundColor:  bgcolor,
      ),
      backgroundColor: bgcolor,
      body: FutureBuilder<List<SongModel>>(
          future: onaudio.querySongs(
            sortType: null,
            orderType: OrderType.ASC_OR_SMALLER,
            ignoreCase: true,
            uriType: UriType.EXTERNAL,
          ),
          builder: (context, item) {
            if (item.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (item.data!.isEmpty) {
              return Center(
                child: Text("No Song Found"),
              );
            }
            songs.clear();
            songs = item.data!;
            return ListView.builder(
              itemCount: item.data!.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.only(top: 15, left: 12, right: 16),
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    decoration: BoxDecoration(
                        color: bgcolor,
                        //Colors.indigo[400],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              offset: Offset(-2, -2),
                              color: Colors.white70),
                          BoxShadow(
                              blurRadius: 4,
                              offset: Offset(4, 4),
                              color: Colors.black87),
                        ]),
                    child: ListTile(
                      textColor: Colors.white,
                      title: Text(item.data![index].displayName),
                      subtitle: Text(item.data![index].displayName,
                          style: TextStyle(color: Colors.white60)),
                      // trailing: IconButton(
                      //   onPressed: () {
                      //     deleteFile(File("storage/emulated/0/Music" +
                      //         "/${item.data![index].title}"));
                      //   },
                      //   icon: Icon(Icons.delete),
                      // ),
                      leading: Image(
                        image: AssetImage("image/music.jpg"),
                      ),
                      //QueryArtworkWidget(
                      //     id: item.data![index].id, type: ArtworkType.AUDIO),
                      onTap: () async {
                        changePlayerViewVisibility();
                        // toast(context, "Playing:" + item.data![index].title);
                        // String? uri = item.data![index].uri;
                        // await audioplayer.setAudioSource(AudioSource.uri(Uri.parse(uri!)));

                        // setState(() async {
                        //
                        // });
                        await audioplayer.setAudioSource(
                            createplaylist(item.data!),
                            initialIndex: index);
                        await audioplayer.play();
                      },
                    ));
              },
            );
          }),
    );
  }

  // void toast(BuildContext context, String s) {
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text(''),
  //     behavior: SnackBarBehavior.floating,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
  //   ));
  // }

  void requestStoragePermission() async {
    if (!kIsWeb) {
      bool permissionStatus = await onaudio.permissionsStatus();
      if (!permissionStatus) {
        await onaudio.permissionsRequest();
      }
      setState(() {});
    }
  }

  ConcatenatingAudioSource createplaylist(List<SongModel> songs) {
    List<AudioSource> sources = [];
    for (var song in songs) {
      sources.add(AudioSource.uri(Uri.parse(song.uri!)));
    }
    return ConcatenatingAudioSource(children: sources);
  }

  void _updatecurrentsongdetails(int index) {
    setState(() {
      if (songs.isNotEmpty) {
        currentSongTitle = songs[index].title;
        currentIndex = index;
      }
    });
  }

  getDecoration(
      BoxShape shape, Offset offset, double blurRadius, double spreadRadius) {
    return BoxDecoration(
        color: bgcolor,
        shape: shape,
        image: DecorationImage(
            image: AssetImage("image/music.jpg"), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
              offset: -offset,
              color: Colors.white70,
              blurRadius: blurRadius,
              spreadRadius: spreadRadius),
          BoxShadow(
              offset: offset,
              color: Colors.black,
              blurRadius: blurRadius,
              spreadRadius: spreadRadius),
        ]);
  }

  BoxDecoration getRectDecoration(BorderRadius borderRadius, Offset offset,
      double blurRadius, double spreadRadius) {
    return BoxDecoration(
        borderRadius: borderRadius,
        color: bgcolor,
        boxShadow: [
          BoxShadow(
              offset: -offset,
              color: Colors.white70,
              blurRadius: blurRadius,
              spreadRadius: spreadRadius),
          BoxShadow(
              offset: offset,
              color: Colors.black,
              blurRadius: blurRadius,
              spreadRadius: spreadRadius),
        ]);
  }
}

class DurationState {
  DurationState({this.position = Duration.zero, this.total = Duration.zero});

  Duration position, total;
}
