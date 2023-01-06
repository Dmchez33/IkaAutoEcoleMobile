import 'package:flutter/material.dart';
import 'package:ika_auto_ecole/Pages/Compte/compte.dart';
import 'package:ika_auto_ecole/Pages/Cours/cours.dart';
import 'package:ika_auto_ecole/Pages/Quiz/quiz.dart';
import 'package:ika_auto_ecole/Pages/Statistique/statistique.dart';
import 'package:ika_auto_ecole/Pages/Videos/video.dart';
import 'package:ika_auto_ecole/Pages/map/map.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
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
  static const List<Widget> _widgetOptions = <Widget>[
    localisation(),
    cours(),
    quiz(),
    statistique(),
    video(),
    compte(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        /*appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),*/

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
                backgroundColor: Color(0xFF6200EE),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book),
                label: 'Cours',
                backgroundColor: Color(0xFF6200EE),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Quiz',
                backgroundColor: Color(0xFF6200EE),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.insert_chart),
                label: 'Statistique',
                backgroundColor: Color(0xFF6200EE),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.ondemand_video),
                label: 'Vidéos',
                backgroundColor: Color(0xFF6200EE),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_pin),
                label: 'Compte',
                backgroundColor: Color(0xFF6200EE),
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
          localisation(),
          cours(),
          quiz(),
          statistique(),
          video(),
          compte(),
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
