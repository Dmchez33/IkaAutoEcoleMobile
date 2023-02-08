import 'dart:async';
import 'dart:convert';
// import 'package:latlong2/latlong.dart' as LatLng;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/Compte/Connexion.dart';
import 'Pages/HomePage.dart';
import 'Pages/carousel.dart';
import 'Provider/AutoecoleDataProvider.dart';



/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JWT TOKEN FLUTTER APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  late SharedPreferences sharedPreferences;

  late int id;
  late String username ;
  late String email ;
  late List roles ;
  late String accessToken ;
  late String tokenType ;

  @override
  void initState(){
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async{
    sharedPreferences = await SharedPreferences.getInstance();

    String? jsonString = sharedPreferences.getString("body");
    Map<String, dynamic> jsonMap = json.decode(jsonString!);
    id = jsonMap['id'];
    username = jsonMap['username'];
    email = jsonMap['email'];
    roles = jsonMap['roles'];
    accessToken = jsonMap['accessToken'];
    tokenType = jsonMap['tokenType'];

    print(id);

    if(sharedPreferences.getString("accessToken") == null){
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
              (Route<dynamic> route) => false
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JWT TOKEN'),
        actions: <Widget>[
          ElevatedButton(
            onPressed: (){
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
                      (Route<dynamic> route) => false
              );
            },
            child: Text('Logout'),
          ),
        ],
      ),
      body: Center(
        child: Text('Main Page'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Idrissz'),
              accountEmail: Text('idrissa@gmail.com'),
            ),

            ListTile(
              title: Text('List Products'),
              trailing: Icon(Icons.list),
              onTap: (){},
            ),

            ListTile(
              title: Text('Add Products'),
              trailing: Icon(Icons.add),
              onTap: (){},
            ),

            ListTile(
              title: Text('Register User'),
              trailing: Icon(Icons.person_add),
              onTap: (){},
            ),

          ],
        ),
      ),
    );
  }
}*/

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AutoecoleDataProvider>(
      create: (context) => AutoecoleDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: _title,
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        home:FutureBuilder(
          future: _checkUser(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return snapshot.data;
            }
            return CircularProgressIndicator();
          },
        ),

      ),
    );
  }
  Future<Widget> _checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    if (isLoggedIn) {
      return MainPage();
    }
    return CarouselPage();
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
