import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MyMusicPage extends StatefulWidget {
  const MyMusicPage({Key? key}) : super(key: key);

  @override
  State<MyMusicPage> createState() => _MyMusicPageState();
}

class _MyMusicPageState extends State<MyMusicPage> {
  int timeToSeek = 10;

  final AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async {
    await player.setSource(AssetSource('music/music_2.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music player"),
      ),
      body: Column(
        children: [
          IconButton(
              onPressed: () async {
                await player.play(AssetSource('music/music_2.mp3'));
              },
              icon: Icon(Icons.play_arrow)),
          IconButton(
              onPressed: () async {
                await player.pause();
              },
              icon: Icon(Icons.pause)),
          IconButton(
              onPressed: () async {
                await player.resume();
              },
              icon: Icon(Icons.reset_tv)),
          IconButton(
              onPressed: () async {
                await player.stop();
              },
              icon: Icon(Icons.stop)),
          IconButton(
              onPressed: () async {
                setState(() {
                  timeToSeek += 10;
                });
                await player.seek(Duration(seconds: timeToSeek));
              },
              icon: Icon(Icons.send_and_archive_outlined)),
        ],
      ),
    );
  }
}
