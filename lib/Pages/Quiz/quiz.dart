import 'package:flutter/material.dart';

class quiz extends StatefulWidget {
  const quiz({Key? key}) : super(key: key);

  @override
  _quizState createState() => _quizState();
}

class _quizState extends State<quiz> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Quiz'),
      ),
    );
  }
}