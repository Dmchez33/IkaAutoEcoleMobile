import 'package:flutter/material.dart';
import 'package:ika_auto_ecole/Pages/Compte/compte.dart';
import 'package:ika_auto_ecole/Pages/Cours/cours.dart';
import 'package:ika_auto_ecole/Pages/Quiz/quiz.dart';
import 'package:ika_auto_ecole/Pages/Quiz/quizPage.dart';
import 'package:ika_auto_ecole/Pages/Statistique/statistique.dart';
import 'package:ika_auto_ecole/Pages/Videos/video.dart';
import 'package:ika_auto_ecole/Pages/map/listeLieux.dart';
import 'package:ika_auto_ecole/Pages/map/map.dart';
import 'package:ika_auto_ecole/Pages/widgets/question_screen.dart';

import '/Pages/Cours/coursePage.dart';
import '/Pages/Quiz/Question.dart';
import '/Pages/Quiz/SeletedQuestionPage.dart';


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  void _onItemTapped(int index) {
    if (_selectedIndex == 1 && index == 0) {
      Navigator.popUntil(context, ModalRoute.withName("/localisation"));
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //LE CORPS DE L'APP A L'INTERIEUR DUQUEL LE CONTENU DES ELEMENTS AFFICHERA
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
            _buildOffstageNavigator(3),
          ],
        ),

        //WIDGET ClipRRect PERMET D'AJOUTER UN BORDER RADIUS A UN NOTRE WIDGET
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Localisation',
                backgroundColor: Color(0xFF1A237E),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book),
                label: 'Cours',
                backgroundColor: Color(0xFF1A237E),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Quiz',
                backgroundColor: Color(0xFF1A237E),
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.ondemand_video),
                label: 'Vidéos',
                backgroundColor: Color(0xFF1A237E),
              ),

            ],
            currentIndex: _selectedIndex,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ));
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          const localisation(),
          cours(),
          //QuestionsScreen(),
          QuizSelectionPage(
            quizTypes: {
              "Quiz 1": [
                Question(
                  questionText: "Quel est la capital du Mali?",
                  options: ["Bamako", "Togo", "Kidal", "Sikasso"],
                  imageUrl: "assets/logo/logonoir.png",
                  correctAnswer: "Bamako",
                ),
                Question(
                  questionText: "Quel est la capital du Sénégal?",
                  options: ["Paris", "Dakar", "Londre", "Bamako"],
                  correctAnswer: "Dakar",
                ),
                Question(
                  questionText: "Quel est la capital de la Cote d'ivoire?",
                  options: ["Abuja", "Yorosso", "Benin", "Berlin"],
                  correctAnswer: "Paris",
                ),
              ],
              "Quiz 2": [
                Question(
                  questionText: "Qui est Alassane Dramane Ouatara la Côte d'ivoire?",
                  options: ["Président", "Premier Ministre", "Ancien Debuté", "Joueur"],
                  correctAnswer: "Président",
                ),
                Question(
                  questionText: "Qui est Assimi Goita du Mali?",
                  options: ["Président", "Militaire", "Ancien Debuté", "Joueur"],
                  correctAnswer: "Militaire",
                ),
                Question(
                  questionText: "Qui est Modibo Keita du Mali?",
                  options: ["Président", "Politicien", "Ancien President", "Joueur"],
                  correctAnswer:  "Ancien President",
                ),
              ]
            },
          ),

          const video(),

        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}

/*
class TestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyStatefulWidgetState();
  }
}

class TestScreenState extends State<TestScreen> {
  PageController _pageController = PageController();

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  final List<Widget> _widgetOptions = <Widget>[
    const localisation(),
    CoursePage(),
    QuizSelectionPage(
      quizTypes: {
        "Quiz 1": [
          Question(
            questionText: "Quel est la capital du Mali?",
            options: ["Bamako", "Togo", "Kidal", "Sikasso"],
            imageUrl: "assets/logo/logonoir.png",
            correctAnswer: "Bamako",
          ),
          Question(
            questionText: "Quel est la capital du Sénégal?",
            options: ["Paris", "Dakar", "Londre", "Bamako"],
            correctAnswer: "Dakar",
          ),
          Question(
            questionText: "Quel est la capital de la Cote d'ivoire?",
            options: ["Abuja", "Yorosso", "Benin", "Berlin"],
            correctAnswer: "Paris",
          ),
        ],
        "Quiz 2": [
          Question(
            questionText: "Qui est Alassane Dramane Ouatara la Côte d'ivoire?",
            options: ["Président", "Premier Ministre", "Ancien Debuté", "Joueur"],
            correctAnswer: "Président",
          ),
          Question(
            questionText: "Qui est Assimi Goita du Mali?",
            options: ["Président", "Militaire", "Ancien Debuté", "Joueur"],
            correctAnswer: "Militaire",
          ),
          Question(
            questionText: "Qui est Modibo Keita du Mali?",
            options: ["Président", "Politicien", "Ancien President", "Joueur"],
            correctAnswer:  "Ancien President",
          ),
        ]
      },
    ),
    const video(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _currentIndex = 0;
  bool _showBottomNavigationBar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar:
      Offstage(
        offstage: !_showBottomNavigationBar,
        child: CustomBottomNavigationBar(
          backgroundColor: Color(0xFF1A237E),
          itemBackgroudnColor: Color(0xFF1A237E),
          items: [
            CustomBottomNavigationBarItem(
              icon: Icons.map,
              title: 'Localisat',
            ),
            CustomBottomNavigationBarItem(
              icon: Icons.menu_book,
              title: 'Cours',
            ),
            CustomBottomNavigationBarItem(
              icon: Icons.question_answer,
              title: 'Quiz',
            ),
            CustomBottomNavigationBarItem(
              icon: Icons.ondemand_video,
              title: 'video',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              if (index == 5) {
                _showBottomNavigationBar = false;
              } else {
                _showBottomNavigationBar = true;
              }
            });
          },
        ),
      )

    );
  }
}*/
