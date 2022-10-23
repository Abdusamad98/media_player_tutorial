import 'dart:io';

import 'package:flutter/material.dart';

class GetAllMp3 extends StatefulWidget {
  const GetAllMp3({Key? key}) : super(key: key);

  @override
  State<GetAllMp3> createState() => _GetAllMp3State();
}

class _GetAllMp3State extends State<GetAllMp3> {

  @override
  void initState() {
    getFiles();
    super.initState();
  }


  void getFiles() async {
    //asyn function to get list of files
    Directory dir = Directory('/storage/emulated/0/');
    String mp3Path = dir.toString();
    print(mp3Path);
    List<FileSystemEntity> _files;
    List<FileSystemEntity> _songs = [];
    _files = dir.listSync(recursive: true, followLinks: false);
    for (FileSystemEntity entity in _files) {
      String path = entity.path;
      if (path.endsWith('.mp3')) _songs.add(entity);
    }
    print(_songs);
    print(_songs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
