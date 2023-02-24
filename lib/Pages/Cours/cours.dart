import 'dart:convert';

import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:ika_auto_ecole/Model/Panneaux.dart';
import 'package:ika_auto_ecole/Pages/Cours/ListeCoursParContenu.dart';
import 'package:ika_auto_ecole/Provider/AutoecoleDataProvider.dart';
import 'package:ika_auto_ecole/Service/PanneauxService.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/TypeDeCourOuvert.dart';
import '../../Service/CoursService.dart';
import '../Compte/Connexion.dart';
import '../Compte/compte.dart';
import '../utilities/keys.dart';
import 'DetailCours.dart';

class cours extends StatefulWidget {
  const cours({Key? key}) : super(key: key);

  @override
  _coursState createState() => _coursState();
}

class _coursState extends State<cours> {
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
    getAllCours();
    playAudioWelCome = false;
  }

  //LES ELEMENTS DU COURS
  CoursService coursService = CoursService();
  List<Cours>? cours;

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isLoggedIn = sharedPreferences.getBool("isLoggedIn")!;
    //String? jsonString = sharedPreferences.getString("body");
    //Map<String, dynamic> jsonMap = json.decode(jsonString!);
    //id = jsonMap['id'];
    /*username = jsonMap['username'];
    email = jsonMap['email'];
    roles = jsonMap['roles'];
    accessToken = jsonMap['accessToken'];
    tokenType = jsonMap['tokenType'];*/

    if (sharedPreferences.getString("accessToken") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
              (Route<dynamic> route) => false);
    }
  }

  getAllCours() async {
    cours = await coursService.getAllTypeCours();
    Provider.of<AutoecoleDataProvider>(context, listen: false)
        .TypeCoursOuvert = cours!;
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    if (cours == null) {
      return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xFF1A237E),
            centerTitle: true,
            title: const Text('Cours'),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1A237E)),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) => compte()),
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
          body: const Center(

            child: CircularProgressIndicator(),
          ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF1A237E),
          centerTitle: true,
          title: const Text('Cours'),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A237E)),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => compte()),
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
            height: 150,
            decoration: const BoxDecoration(
              color: Color(0xFF1A237E),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),),
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
                        for(int i=0; i<cours!.length; i++)...[
                          Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .outline,
                                ),
                                //
                                // borderRadius: const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (
                                          context) => ListeCoursParContenu(idType: cours![i].id),
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                        child: Image.network(
                                          "${cours![i].image}",
                                          height: 250,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                          alignment: Alignment.bottomCenter,
                                          height: 20,
                                          color: Colors.white,
                                          child: FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Text(
                                                '${cours![i].libelle}',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Poppins",
                                                ),
                                              ))),
                                    ),
                                  ],
                                ),
                              )),
                        ],


                      ],
                    )),
              ),
            ],
          ),
        ),
      );
    }
  }
}

/*

//METHODE PERMETTANT DE DECONNECTER UN UTILISATEUR
PopupMenuButton(
            itemBuilder: (context) {
              List<PopupMenuItem<int>> items = [];
              items.add(const PopupMenuItem(
                value: 1,
                child: Text("Profil"),
              ));

              if (isLoggedIn) {
                isLoggedIn = false;
                items.add(PopupMenuItem(
                  value: 2,
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      sharedPreferences.clear();
                      sharedPreferences.commit();
                      /*Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) => LoginPage()),
                          (Route<dynamic> route) => false);*/
                    },
                    child: Text("Déconnecter", style: TextStyle(color: Colors.black),),
                  ),
                ));
              }else{
                items.add(PopupMenuItem(
                  value: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: Colors.white),
                    onPressed: () {
                      sharedPreferences.clear();
                      sharedPreferences.commit();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) => LoginPage()),
                              (Route<dynamic> route) => false);
                    },
                    child: Text("Connecter",style: TextStyle(color: Colors.black),),
                  ),
                ));
              }

              return items;
            },
            icon: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
          ),
 */