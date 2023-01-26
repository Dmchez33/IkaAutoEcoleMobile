
import 'package:flutter/material.dart';

import 'Pages/HomePage.dart';
import 'Pages/carousel.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: MyHomePage(),

    );
  }
}


/*
//AFFICHER D'UNE PREMIER PAGE LORS DE LANCEMENT DE L'APPLICATION
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _hasSeenWelcomeScreen = false;

  @override
  void initState() {
    super.initState();
    _checkIfHasSeenWelcomeScreen();
  }

  void _checkIfHasSeenWelcomeScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? hasSeenWelcomeScreen = prefs.getBool('has_seen_welcome_screen');
    if (hasSeenWelcomeScreen == null) {
      hasSeenWelcomeScreen = false;
    }
    setState(() {
      _hasSeenWelcomeScreen = hasSeenWelcomeScreen!;
    });
  }

  void _setHasSeenWelcomeScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('has_seen_welcome_screen', true);
    setState(() {
      _hasSeenWelcomeScreen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_hasSeenWelcomeScreen) {
      return MainScreen();
    } else {
      return Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Text('Passer'),
            onPressed: () {
              _setHasSeenWelcomeScreen();
            },
          ),
        ),
      );
    }
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Text('Accueil'),
      ),
    );
  }
}
*/
