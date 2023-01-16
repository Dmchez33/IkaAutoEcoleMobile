import 'package:flutter/material.dart';

class quiz extends StatefulWidget {
  const quiz({Key? key}) : super(key: key);

  @override
  _quizState createState() => _quizState();
}

class _quizState extends State<quiz> {
  int _currentQuestionIndex = 0;
  Map<int, dynamic> _answers = {};

  void _submitAnswer(int index, dynamic answer) {
    setState(() {
      _answers[_currentQuestionIndex] = answer;
    });
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Quiz1'),
      ),
    );
  }
}