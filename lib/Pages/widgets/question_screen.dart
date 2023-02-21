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
        question: "Quelle est la signification de ce panneau ?",
        image: "assets/images/imageMap/question1.png",
        options: {
          'entrée sur un chemin privé': false,
          'Route barrée temporairement': false,
          'Passage à niveau ': true,
          'Attention aux troupeaux d’animaux': false,
        }, title: "Quelle est la signification de ce panneau ?"),
    Question(id: 2,
        question: "Que signifie ce panneau ?",
        image: "assets/images/imageMap/question2.png",
        options: {
          'Priorité à droite': false,
          'Céder le passage ': true,
          'Stop': false,
          'Route à caractère priotaire': false,
        }, title: "Que signifie ce panneau ?"),
    Question(id: 3,
        question: "De ce côté de la rue, à partir de quelle date je peux stationner ?",
        image: "assets/images/imageMap/question3.png",
        options: {
          'Le 1er du mois': false,
          'Le 15 du mois': false,
          'Le 16 du mois': true,
          'Le 31 du mois': false,
        }, title: "De ce côté de la rue, à partir de quelle date je peux stationner ?"),
    Question(id: 4,
        question: "Que signifie ce panneau ?",
        image: "assets/images/imageMap/question4.png",
        options: {
          'Arrçet de bus': false,
          'Déviation': false,
          'Emplacement d\'arrçet d\'urgence': true,
          'Couloir de bus': false,
        }, title: ''),
    Question(id: 5,
        question: "Que veut dire ce panneau?",
        image: "assets/images/imageMap/question5.png",
        options: {
          'Aller tout droit': false,
          'Priorité à droite à la prochaine intersection': true,
          'Arrêt à la prochaine intersection': false,
          'Priorité ponctuelle': false,
        }, title: "Que veut dire ce panneau?"),
    Question(id: 6,
        question: "Que peut on rencontrer à l'approche de ce panneau?",
        image: "assets/images/imageMap/question6.png",
        options: {
          'De la neige': false,
          'Des pluies verglassâtes': false,
          'Du brouillard ou de la fumée': true,
          'Un passage piéton': false,
        }, title: "Que peut on rencontrer à l'approche de ce panneau?"),
    Question(id: 7,
        question: "Qui est interdit de circuler après ce panneau ?",
        image: "assets/images/imageMap/question7.png",
        options: {
          'Les voitures': false,
          'Les vélos': false,
          'Les scooters': false,
          'Tout le monde peut circuler': true,
        }, title: "Qui est interdit de circuler après ce panneau ?"),
    Question(id: 8,
        question: "En ville, un panneau de danger est indiqué à quelle distance du lieu ?",
        image: "assets/images/imageMap/question8.png",
        options: {
          'Sur le lieu du danger': false,
          '50m': true,
          '150m': false,
          '500m': false,
        }, title: "En ville, un panneau de danger est indiqué à quelle distance du lieu ?")
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
                indexAction: index,
                image: _questions[index].image,// currently at 0.
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
                  //alignment: FractionalOffset.bottomCenter,
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

