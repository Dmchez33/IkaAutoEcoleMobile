import 'package:flutter/material.dart';

class video extends StatefulWidget {
  const video({Key? key}) : super(key: key);

  @override
  _videoState createState() => _videoState();
}

class _videoState extends State<video> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Video'),
      ),
    );
  }
}