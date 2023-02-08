/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

import '../Statistique/statistique.dart';
import 'Question.dart';
import 'ResultatPage.dart';
import 'SeletedQuestionPage.dart';

class QuizPage extends StatefulWidget {
  final List<Question> questions;

  QuizPage({required this.questions});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  final Map<int, dynamic> _answers = {};
  IconData icon = Icons.keyboard_arrow_down;

  bool isNextButtonVisible =
      false; // Variable pour stocker l'état de visibilité du bouton suivant.

  void _submitAnswer(int index, dynamic answer) {
    setState(() {
      _answers[_currentQuestionIndex] = answer;
      isNextButtonVisible =
          true; // Affiche le bouton suivant lorsque l'utilisateur sélectionne une réponse.
    });
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
      isNextButtonVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[_currentQuestionIndex];

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Card(
              elevation: 0,
              color: Colors.white10,
              child: Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(10),
                      child: const Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text("Examens Blanc",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)
                      )),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text("Question ${_currentQuestionIndex+1}/${widget.questions.length}",style: TextStyle(fontSize: 20),)
                    )),

                  if (question.imageUrl != null)
                    Image.asset("assets/logo/logonoir.png"),
                  Text(
                    question.questionText,
                    style:
                    const TextStyle(fontFamily: "Montserrat", fontSize: 20),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Wrap(
                  spacing: 8.0, // horizontal space between children
                  runSpacing: 4.0, // vertical space between rows
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: question.options.map((option) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width ,
                      child:  AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: _answers[_currentQuestionIndex] == option
                                ? Colors.lightBlue
                                : Colors.white,
                            //borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: _answers[_currentQuestionIndex] == option
                                    ? Colors.lightBlue
                                    : Colors.black26),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () =>
                                  _submitAnswer(_currentQuestionIndex, option),
                              child: Center(
                                child: Text(
                                  option,
                                  style: TextStyle(
                                      color: _answers[_currentQuestionIndex] == option
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          )),
                    );
                  }).toList(),
                )),

            Visibility(
                visible:
                    isNextButtonVisible, // Affiche le bouton suivant uniquement si isNextButtonVisible est true.,
                child: Row(
                  children: [
                    if (_currentQuestionIndex < widget.questions.length - 1)
                      Container(
                        margin: EdgeInsets.all(10),
                        child: FloatingActionButton(
                          backgroundColor: Color(0xFF1A237E),
                          child: Icon(Icons.check),
                          onPressed: _nextQuestion,
                        ),
                      ),
                    if (_currentQuestionIndex == widget.questions.length - 1)
                      ElevatedButton(
                        child: const Text("Soumettre"),
                        onPressed: () {
                          final answers = _answers.values.toList();
                          // check answers and navigate to result page
                          int correctAnswers = 0;

                          for (int i = 0; i < answers.length; i++) {
                            if (answers[i] ==
                                widget.questions[i].correctAnswer) {
                              correctAnswers++;
                            }
                          }

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AlertDialog(
                                      title: const Text("Résultats"),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text(
                                              "Bonnes réponses: $correctAnswers / ${widget.questions.length}"),
                                          const SizedBox(height: 16.0),
                                          Text(
                                              "Votre pourcentage de réussite est de ${(correctAnswers / widget.questions.length * 100).round()}%"),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          child: const Text("OK"),
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => statistique()),
                                            );
                                          },
                                        ),
                                      ],
                                    )),
                          );
                        },
                      ),
                  ],
                ))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}*/


import 'package:material_dialogs/widgets/buttons/icon_button.dart';

import '../Compte/StatisticPage.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestion = 0;
  int score = 0;
  final Map<int, Map<String, Object>> quizData = {
    0: {
      'question': 'What is Flutter?',
      'options': ['A framework', 'A library', 'A programming language', 'An operating system'],
      'answer': 0,
    },
    1: {
      'question': 'What is Dart?',
      'options': ['A framework', 'A library', 'A programming language', 'An operating system'],
      'answer': 2,
    },
    2: {
      'question': 'What is the use of Flutter?',
      'options': ['Web development', 'Desktop development', 'Mobile development', 'All of the above'],
      'answer': 3,
    },
  };

  List<bool> answers = [false, false, false, false];

  void checkAnswer(int index) {
    setState(() {
      answers = [false, false, false, false];
      answers[index] = true;
      if (index == quizData[currentQuestion]!['answer']) {
        score++;
      }
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestion < quizData.length - 1) {
        currentQuestion++;
        answers = [false, false, false, false];
      } else {
        // show dialog with score
        showDialog(
            context: context,
            builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Score'),
            content: Text('Your score is $score out of ${quizData.length}'),
            actions: [
              ElevatedButton(
                child: Text('Retake Quiz'),
                onPressed: () {
                  setState(() {
                    currentQuestion = 0;
                    score = 0;
                    answers = [false, false, false, false];
                  });
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: Text('Statistics'),
                onPressed: () {
                  // navigate to statistics page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StatisticsPage(score: score, totalquestion: quizData.length),
                    ),
                  );
                },
              ),
            ],
          );
        },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: LinearProgressIndicator(
              value: (currentQuestion + 1) / quizData.length,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    quizData[currentQuestion]!['question'] as String,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 16.0),
                  ...( quizData[currentQuestion]!['options'] as List<String>)
                      !.asMap()
                      .entries
                      .map((entry) => Container(
                    child: MaterialButton(
                      onPressed: () => checkAnswer(entry.key),
                      color: answers[entry.key] ? Colors.green : null,
                      child: Text(
                        entry.value,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ))
                      .toList(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: currentQuestion == quizData.length - 1
            ? Text('Submit')
            : Icon(Icons.arrow_forward),
        onPressed: nextQuestion,
      ),
    );
  }
}
