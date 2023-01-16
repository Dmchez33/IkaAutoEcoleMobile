import 'package:flutter/material.dart';

class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;
  final  imageUrl ;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
     this.imageUrl,
  });
}