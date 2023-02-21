import 'package:flutter/material.dart';
import '../constants.dart'; // it contains our colors.

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {Key? key,
      required this.question,
        required this.image,
      required this.indexAction,
      required this.totalQuestions})
      : super(key: key);
  // here we need the question title and the total number of questions, and also the index

  final String question;
  final String image;
  final int indexAction;
  final int totalQuestions;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            '$question',
            style: const TextStyle(
              fontSize: 18.0,
              color: background,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Image.asset(image,width: 200,),
        )
      ],
    );
  }
}
