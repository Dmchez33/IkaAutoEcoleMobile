import 'package:flutter/material.dart';
import 'package:ika_auto_ecole/Pages/Compte/compte.dart';
import 'package:ika_auto_ecole/Pages/Cours/cours.dart';
import 'package:ika_auto_ecole/Pages/Quiz/quiz.dart';
import 'package:ika_auto_ecole/Pages/Quiz/quizPage.dart';
import 'package:ika_auto_ecole/Pages/Statistique/statistique.dart';
import 'package:ika_auto_ecole/Pages/Videos/video.dart';
import 'package:ika_auto_ecole/Pages/map/listeLieux.dart';
import 'package:ika_auto_ecole/Pages/map/map.dart';

import 'Pages/Quiz/Question.dart';
import 'Pages/Quiz/SeletedQuestionPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: const MyStatefulWidget(),
      // routes: {
      //   '/localisation': (context) => localisation(),
      //   '/listelieux': (context) => listeLieux(),
      //   '/video': (context) => video(),
      //   '/quiz': (context) => quiz(),
      //   '/compte': (context) => compte(),
      //   '/statistique': (context) => statistique(),
      //   '/cours': (context) => cours(),
      // },
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // final questions = [
  //   Question(
  //     questionText: "What is the capital of France?",
  //     options: ["Paris", "Rome", "Madrid", "Berlin"],
  //     correctAnswer: "Paris",
  //   ),
  //   Question(
  //     questionText: "What is the capital of Germany?",
  //     options: ["Paris", "Rome", "Berlin", "Madrid"],
  //     correctAnswer: "Berlin",
  //     //imageUrl: "https://example.com/germany.jpg",
  //   ),
  //   // add more questions here
  // ];

  // static  List<Widget> _widgetOptions = <Widget>[
  //   localisation(),
  //   cours(),
  //   QuizPage(questions: [Question(
  //   questionText: "What is the capital of France?",
  //   options: ["Paris", "Rome", "Madrid", "Berlin"],
  //   correctAnswer: "Paris",
  // ),
  // Question(
  //   questionText: "What is the capital of Germany?",
  //   options: ["Paris", "Rome", "Berlin", "Madrid"],
  //   correctAnswer: "Berlin",
  //   //imageUrl: "https://example.com/germany.jpg",
  // ),],),
  //   statistique(),
  //   video(),
  //   compte(),
  // ];

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
        appBar: AppBar(
          backgroundColor: Color(0xFF1A237E),
          centerTitle: true,
          title: [
            const Text('Localisation'),
            const Text('Cours'),
            const Text('Quiz'),
            const Text('Statistique'),
            const Text('Vidéos'),
            const Text('Compte'),
          ][_selectedIndex],
          actions: [Image.asset('assets/images/logoIkaAutoEcole.png')],
        ),

        //LE CORPS DE L'APP A L'INTERIEUR DUQUEL LE CONTENU DES ELEMENTS AFFICHERA
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
            _buildOffstageNavigator(3),
            _buildOffstageNavigator(4),
            _buildOffstageNavigator(5),
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
                icon: Icon(Icons.insert_chart),
                label: 'Statistique',
                backgroundColor: Color(0xFF1A237E),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.ondemand_video),
                label: 'Vidéos',
                backgroundColor: Color(0xFF1A237E),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_pin),
                label: 'Compte',
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
          const cours(),
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
          const statistique(),
          const video(),
          const compte(),
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
