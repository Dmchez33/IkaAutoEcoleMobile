import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Question.dart';
import 'ResultatPage.dart';

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
                  width: MediaQuery.of(context).size.width / 2 - 12,
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _answers[_currentQuestionIndex] == option,
                    onChanged: (checked) =>
                        _submitAnswer(_currentQuestionIndex, option),
                    title: Text(option),
                  ),
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
                                            Navigator.of(context).pop();
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
}