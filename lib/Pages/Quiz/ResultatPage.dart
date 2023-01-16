import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;

  ResultPage({required this.correctAnswers, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Résultats"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("Bonnes réponses: $correctAnswers / $totalQuestions"),
          SizedBox(height: 16.0),
          Text("Votre pourcentage de réussite est de ${(correctAnswers / totalQuestions * 100).round()}%"),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
