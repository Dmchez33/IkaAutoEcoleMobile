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
      body: Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 20,
          // marge vertical entre les elements
          mainAxisSpacing: 20,
          // marge horizontal entre les elements
          crossAxisCount: 2,
          children: <Widget>[
            for (String quizType in quizTypes.keys)
              ElevatedButton(

                style: ElevatedButton.styleFrom(backgroundColor: Colors.white,textStyle: TextStyle()),
                child: Column(
                  children: [
                    Expanded(
                        flex:4,
                        child: Image.asset("assets/images/seletedquiz.gif")),
                    Expanded(child: Text(quizType,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)))
                  ],
                ),
                onPressed: () => _startQuiz(context, quizType),
              ),
          ],
        ),
      )
    );
  }
}
