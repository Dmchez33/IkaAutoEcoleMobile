import 'package:flutter/material.dart';
import 'package:ika_auto_ecole/Pages/Quiz/quizPage.dart';

import '../Compte/compte.dart';
import '../widgets/question_screen.dart';
import 'Question.dart';

class QuizSelectionPage extends StatelessWidget {
  final Map<String, List<Question>> quizTypes;

  QuizSelectionPage({required this.quizTypes});

  void _startQuiz(BuildContext context, String quizType) {
    /*Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizPage(questions: quizTypes[quizType]!, ),
      ),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF1A237E),
          centerTitle: true,
          title: const Text('Quiz'),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF1A237E)),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => compte()),
                );
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        //appBar: AppBar(title: Text("Sélection de quiz")),
        body: Column(
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: ClipPath(
            clipper: BottomArcClipper(),
            child: Container(
              color: Color(0xFF1A237E),
            ),
          ),
        ),
        Expanded(
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
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, textStyle: TextStyle()),
                    child: Column(
                      children: [
                        Expanded(
                            flex: 4,
                            child: Image.asset("assets/images/seletedquiz.gif")),
                        Expanded(
                            child: Text(quizType,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)))
                      ],
                    ),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuestionsScreen(),
                        ),
                      )
                    },
                  ),
              ],
            ),
        )
      ]
    ));
  }
}

//WIDGET PERMETTANT DE METTRE LA BORDURE SOUS FORME D'ARC
class BottomArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
