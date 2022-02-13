import 'package:flutter/material.dart';
import 'package:live_stream_test_app/components/video_items.dart';
import 'package:video_player/video_player.dart';

class VideoList extends StatelessWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ders Videoları"),
        centerTitle: true,
      ),
      body: VideoItems(
        videoPlayerController:
            VideoPlayerController.asset('assets/video_2.mp4'),
        looping: true,
        autoplay: true,
        size: size,
      ),
    );
  }
}
