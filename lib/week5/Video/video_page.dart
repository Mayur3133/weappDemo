import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertask/week5/Video/video_player_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class videoply extends StatefulWidget {
  const videoply({Key? key}) : super(key: key);

  @override
  State<videoply> createState() => _videoplyState();
}

class _videoplyState extends State<videoply> {
  List<AssetEntity> assets = [];

  videolist() async {
    final video = await PhotoManager.getAssetPathList(type: RequestType.video);
    final allvideos = video.first;
    final videoAssets = await allvideos.getAssetListRange(
      start: 0,
      end: allvideos.assetCount,
    );

    setState(() {
      assets = videoAssets;
    });
  }

  //List prop = ['Title', 'Resolution', 'Format', 'Path', 'Duration', 'Date'];

  @override
  void initState() {
    videolist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text("Video Player")),
      body: ListView.builder(
        itemCount: assets.length,
        itemBuilder: (context, index) => FutureBuilder<Uint8List?>(
          future: assets[index].thumbnailData,
          builder: (context, snapshot) {
            List title = assets[index].relativePath!.split('/').toList();
            final bytes = snapshot.data;
            if (bytes == null) {
              return Shimmer(
                color: Colors.grey,
                enabled: true,
                direction: ShimmerDirection.fromLeftToRight(),
                duration: Duration(seconds: 3),
                interval: Duration(seconds: 5),
                child: Container(
                  color: Colors.grey.shade900,
                  height: size.height * 0.12,
                  width: size.width * 0.06,
                  margin: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                ),
              );
            }
            return InkWell(
              onTap: () {
                setState(
                  () {
                    print(assets[index].relativePath.toString());
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            videoplyscreen(assets:assets,curnt:index),
                      ),
                    );
                  },
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                alignment: Alignment.center,
                height: size.height * 0.12,
                width: size.width * 0.06,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height * 0.115,
                      width: size.width * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        image: DecorationImage(
                          image: MemoryImage(bytes),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(1),
                            margin: EdgeInsets.fromLTRB(
                                0, 0, size.width * 0.012, size.width * 0.012),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: size.width * 0.035,
                                ),
                                Text(
                                  assets[index].videoDuration.inHours == 0
                                      ? "${assets[index].videoDuration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${assets[index].videoDuration.inSeconds.remainder(60).toString().padLeft(2, '0')}"
                                      : '${assets[index].videoDuration.inHours.toString().padLeft(2, '0')}:${assets[index].videoDuration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${assets[index].videoDuration.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size.width * 0.025),
                                ),
                              ],
                            ),
                          ),
                        ],
                        alignment: Alignment.bottomRight,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Container(
                      width: size.width * 0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            // assets[index].relativePath.toString(),
                            assets[index].title!.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.005,
                          ),
                          Text(
                            assets[index].orientatedSize.toString(),
                            style: GoogleFonts.inter(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
