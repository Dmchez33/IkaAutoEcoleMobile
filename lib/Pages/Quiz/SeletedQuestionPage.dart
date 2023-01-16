import 'package:flutter/material.dart';
import 'package:ika_auto_ecole/Pages/Quiz/quizPage.dart';

import 'Question.dart';

class QuizSelectionPage extends StatelessWidget {
  final Map<String, List<Question>> quizTypes;

  QuizSelectionPage({required this.quizTypes});

  void _startQuiz(BuildContext context, String quizType) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizPage(questions: quizTypes[quizType]!, ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sélection de quiz")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (String quizType in quizTypes.keys)
            ElevatedButton(
              child: Text(quizType),
              onPressed: () => _startQuiz(context, quizType),
            ),
        ],
      ),
    );
  }
}
