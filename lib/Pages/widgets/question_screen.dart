import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:ika_auto_ecole/Pages/widgets/question_widget.dart';
import 'package:ika_auto_ecole/Pages/widgets/result_box.dart';


import '../constants.dart';
import '../models/question_model.dart';
import 'next_button.dart';
import 'option_card.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuetionsScreenState();
}

class _QuetionsScreenState extends State<QuestionsScreen> {

  final List<Question> _questions = [
    Question(id: 1,
        question: "Laquelle de ces asertions est une infraction?",
        options: {
          'Manger dans sa voiture': false,
          'Arrêt non authorisé': true,
          'S\'arrêter quand on veut': false,
          'Se tenir debout sur sa moto': false,
        }, title: "Laquelle de ces asertions est une infraction?"),
    Question(id: 2,
        question: "Laquelle de ces asertions est une infraction?",
        options: {
          'Dans sa voiture': true,
          'Arrêt non': false,
          'S\'arrêter on veut': false,
          'Se tenir debout sur moto': false,
        }, title: "Laquelle de ces asertions est une infraction?"),
    Question(id: 3,
        question: "Laquelle de ces asertions est une infraction?",
        options: {
          'Manger': false,
          'Authorisé': false,
          'Quand on veut': false,
          'Debout sur sa moto': true,
        }, title: "Laquelle de ces asertions est une infraction?"),
    Question(id: 4,
        question: "Laquelle de ces asertions est une infraction?",
        options: {
          'Sa voiture': false,
          'Arrêt': false,
          'S\'arrêter veut': true,
          'Se moto': false,
        }, title: ''),
    Question(id: 5,
        question: "Infraction?",
        options: {
          'Manger dans sa voiture': false,
          'Arrêt non authorisé': true,
          'S\'arrêter quand on veut': false,
          'Se tenir debout sur sa moto': false,
        }, title: "Infraction?"),
    Question(id: 6,
        question: "Est-ce une infraction?",
        options: {
          'Dans sa voiture': true,
          'Arrêt non': false,
          'S\'arrêter on veut': false,
          'Se tenir debout sur moto': false,
        }, title: "Est-ce une infraction?"),
    Question(id: 7,
        question: "Choisis la bonne infraction?",
        options: {
          'Manger': false,
          'Authorisé': false,
          'Quand on veut': false,
          'Debout sur sa moto': true,
        }, title: "Choisis la bonne infraction?"),
    Question(id: 8,
        question: "Une infraction?",
        options: {
          'Sa voiture': false,
          'Arrêt': false,
          'S\'arrêter veut': true,
          'Se moto': false,
        }, title: "Une infraction?")
  ];

  int index = 0;

  int score = 0;

  bool isPressed = false;

  bool isAlreadySelected = false;

  // create a function to start over
  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  void startToIndex(int i) {
    setState(() {
      index = i;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  Color choixCouleur(bool isPressed, bool index) {
    if(isPressed) {
      if(index) {
        return correct;
      } else {
        incorrect;
      }
    } else {
      return Colors.white;
    }
    return Colors.white;
  }

  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      // this is the block where the questions end.
      showDialog(
          context: context,
          barrierDismissible:
          false,
          // this will disable the dissmis function on clicking outside of box
          builder: (ctx) =>
              ResultBox(
                result: score, // total points the user got
                questionLength: questionLength, // out of how many questions
                onPressed: startOver,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++; // when the index will change to 1. rebuild the app.
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        // Fluttertoast.showToast(
        //   msg: 'Choississez une réponse svp !',
        //   textColor: Colors.white,
        //   backgroundColor: background
        // );
        /*ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Choississez une réponse svp !'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));*/
      }
    }
  }

    void checkAnswerAndUpdate(bool value) {
      if (isAlreadySelected) {
        return;
      } else {
        if (value == true) {
          score++;
        }
        setState(() {
          isPressed = true;
          isAlreadySelected = true;
        });
      }
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'Score: $score',
                style: TextStyle(color: Colors.white),
              ),
              Text('Q. ${(index+1).toString().padLeft(2,'0')}', style:TextStyle( color: Colors.white)),
              GestureDetector(
                onTap: () {
                  showDialog(context: context, builder: (ctx) => ResultBox(
                    result: score,
                    questionLength: _questions.length,
                    onPressed: () => startToIndex(index),
                  )
                  );
                },
                child: const Icon(
                  Icons.menu_rounded,
                ),
              )
            ],
          ),
          backgroundColor: background,
          shadowColor: Colors.transparent,
          /*actions: const [
            Padding(
              padding: EdgeInsets.all(18.0),
              child:
            ),
          ],*/
        ),
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.85,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40),
          decoration: BoxDecoration(
            color: neutral,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              // add the questionWIdget here
              QuestionWidget(
                indexAction: index, // currently at 0.
                question: _questions[index].title, // means the first question in the list.
                totalQuestions:
                _questions.length, // total length of the list
              ),
              //const Divider(color: Colors.white),
              // add some space
              const SizedBox(height: 25.0),
              for (int i = 0;
              i < _questions[index].options.length;
              i++)
                GestureDetector(
                  onTap: () =>
                      checkAnswerAndUpdate(
                          _questions[index].options.values.toList()[i]),
                  child: OptionCard(
                    option: _questions[index].options.keys.toList()[i],
                    color: isPressed
                        ? _questions[index]
                        .options
                        .values
                        .toList()[i] ==
                        true
                        ? correct
                        : incorrect
                        : Colors.white
                  ),
                ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: GestureDetector(
                    onTap: () => nextQuestion(_questions.length),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60.0),
                      child: NextButton(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        // use the floating action button
        /*floatingActionButton: GestureDetector(
          onTap: () => nextQuestion(_questions.length),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.0,vertical: 30),
            child: NextButton(// the above function
            ),
          ),
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerFloat,*/
      );
    }

}

