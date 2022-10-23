import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoPage extends StatefulWidget {
  const MyVideoPage({Key? key}) : super(key: key);

  @override
  State<MyVideoPage> createState() => _MyVideoPageState();
}

class _MyVideoPageState extends State<MyVideoPage> {
  late VideoPlayerController videoController;

  @override
  void initState() {
    videoController = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")
      ..initialize().then((value) {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Video player"),
        ),
        body: Container(
            child: Column(
          children: [
            Center(
              child: videoController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: videoController.value.aspectRatio,
                      child: VideoPlayer(videoController),
                    )
                  : Text("Video player not initialized"),
            ),

          ],
        )),floatingActionButton: FloatingActionButton(
      onPressed: () {
        setState(() {
          videoController.value.isPlaying
              ? videoController.pause()
              : videoController.play();
        });
      },
      child: Icon(
        videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
      ),
    ),);
  }

  @override
  void dispose() {
   videoController.dispose();
    super.dispose();
  }
}
