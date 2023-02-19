import 'dart:convert';

import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:ika_auto_ecole/Model/Panneaux.dart';
import 'package:ika_auto_ecole/Model/TypePanneaux.dart';
import 'package:ika_auto_ecole/Pages/Cours/ListeCoursParContenu.dart';
import 'package:ika_auto_ecole/Provider/AutoecoleDataProvider.dart';
import 'package:ika_auto_ecole/Service/PanneauxService.dart';
import 'package:ika_auto_ecole/Service/TypePanneauxService.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Compte/Connexion.dart';
import '../Compte/compte.dart';
import '../utilities/keys.dart';
import 'ListeContenuPanneaux.dart';

class Panneaux extends StatefulWidget {
  const Panneaux({Key? key}) : super(key: key);

  @override
  _PanneauxState createState() => _PanneauxState();
}

class _PanneauxState extends State<Panneaux> {
  final List<Map<String, String>> test = [
    {"text": "Partage de la route", "url": "partage de la route.jpg"},
    {"text": "Panneau de signalisation", "url": "panneau_de_signal.jpg"},
    {"text": "Notion théoriques et pratiques", "url": "notion_theorie.png"},
    {"text": "Priorités", "url": "priorite.PNG"},
    {"text": "Regle a la circulation", "url": "regle.png"},
    {"text": "Prise de conscience", "url": "regle.png"}
  ];
  final List<String> url = [
    "partage de la route.jpg",
    "panneau_de_signal.jpg",
    "notion_theorie.png",
    "priorite.PNG",
    "regle.png",
    "regle.png"
  ];

  //INFORMATIONS CONCERNANT LES INFORMATION DE L'UTILISATEUR CONNECTER
  late SharedPreferences sharedPreferences;

  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    getAllTypePanneaux();
    playAudioWelCome = false;
  }

  //LES ELEMENTS DU COURS
  PanneauxService panneauxService = PanneauxService();
  List<PanneauDeConduite>? panneaux;

  //TYPE PANNEAUX
  TypePanneauxService typePanneauxService = TypePanneauxService();
  List<TypePanneaux>? typePanneaux;

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isLoggedIn = sharedPreferences.getBool("isLoggedIn")!;

    if (sharedPreferences.getString("accessToken") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (Route<dynamic> route) => false);
    }
  }

  getAllPanneaux() async {
    panneaux = await panneauxService.getAllPanneaux();
    Provider.of<AutoecoleDataProvider>(context, listen: false)
        .panneauDeConduite = panneaux!;
    setState(() {});
  }

  getAllTypePanneaux() async {
    typePanneaux = await typePanneauxService.getAllPanneaux();
    Provider.of<AutoecoleDataProvider>(context, listen: false).typePanneaux =
        typePanneaux!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF1A237E),
        centerTitle: true,
        title: const Text('Panneaux'),
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
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.10,
              child: Image.asset(
                'assets/images/cours1.png',
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Center(
                  child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 5,
                // marge vertical entre les elements
                mainAxisSpacing: 5,
                // marge horizontal entre les elements
                crossAxisCount: 2,
                // nombre d'elements par ligne
                shrinkWrap: true,
                children: [
                  for (int i = 0; i < typePanneaux!.length; i++) ...[
                    Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          //
                          // borderRadius: const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                     LiteContenuPanneaux(nomTypePanneaux: typePanneaux![i].type,),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Container(
                                  child: Image.network(
                                "${typePanneaux![i].image}",
                                height: 250,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              )),
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    alignment: Alignment.bottomCenter,
                                    height: 20,
                                    color: Colors.white,
                                    child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          '${typePanneaux![i].type}',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Poppins",
                                          ),
                                        ))),
                              ),
                            ],
                          ),
                        )
                    ),
                  ]
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
