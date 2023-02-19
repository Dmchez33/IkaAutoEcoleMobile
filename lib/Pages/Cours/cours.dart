import 'dart:convert';

import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:ika_auto_ecole/Model/Panneaux.dart';
import 'package:ika_auto_ecole/Pages/Cours/ListeCoursParContenu.dart';
import 'package:ika_auto_ecole/Provider/AutoecoleDataProvider.dart';
import 'package:ika_auto_ecole/Service/PanneauxService.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  /*late int id;
  late String username;

  late String email;

  late List roles;

  late String accessToken;

  late String tokenType;*/
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    getAllCours();
    playAudioWelCome = false;
  }

  //LES ELEMENTS DU COURS
  PanneauxService panneauxService = PanneauxService();
  List<PanneauDeConduite>? panneaux;

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

  getAllCours() async{
    panneaux = await panneauxService.getAllPanneaux();
    Provider.of<AutoecoleDataProvider>(context,listen: false).panneauDeConduite = panneaux!;
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF1A237E),
        centerTitle: true,
        title: const Text('Cours'),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF1A237E)),
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
            /*Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.10,
              child: Image.asset(
                'assets/images/cours1.png',
                fit: BoxFit.fill,
              ),
            ),*/
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
                              builder: (context) => const ListeCoursParContenu(),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                                child: Image.asset(
                              "assets/images/imagecours/arret et stationnement.png",
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
                                  child: const FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        'arret et stationnement',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins",
                                        ),
                                      ))),
                            ),
                          ],
                        ),
                      )),
                  Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        //borderRadius: const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Stack(
                        children: [
                          Container(
                              child: Image.asset(
                            "assets/images/imagecours/panneau_de_signal.jpg",
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
                                child: const FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      'Panneau de signalisation',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ))),
                          ),
                        ],
                      )),
                  Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        //borderRadius: const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Stack(
                        children: [
                          Container(
                              child: Image.asset(
                            "assets/images/imagecours/priorite.PNG",
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
                                child: const FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      'Priorités',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ))),
                          ),
                        ],
                      )),
                  Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        //borderRadius: const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Stack(
                        children: [
                          Container(
                              child: Image.asset(
                            "assets/images/imagecours/notion_theorie.png",
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
                                child: const FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      'Notion théoriques et pratiques',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ))),
                          ),
                        ],
                      )),
                ],
              )),
            ),

            /// Banner Customized Without Indicator
            BannerCarousel(
              height: 110,
              animation: true,
              viewportFraction: 0.8,
              showIndicator: true,
              spaceBetween: 1.0,
              customizedBanners: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        /*border: Border.all(
                          color: Colors.green,
                          width: 1,
                        ),*/
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/imagecours/Partage_de_la_route.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          alignment: Alignment.bottomCenter,
                          height: 20,
                          color: Colors.white,
                          child: const FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'Partage de la route',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        /*border: Border.all(
                          color: Colors.green,
                          width: 1,
                        ),*/
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                          image:
                              AssetImage('assets/images/imagecours/tunel.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          alignment: Alignment.bottomCenter,
                          height: 20,
                          color: Colors.white,
                          child: const FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'Tunels et partages',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        /*border: Border.all(
                          color: Colors.green,
                          width: 1,
                        ),*/
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/imagecours/Visibilité_et_eclairage.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          alignment: Alignment.bottomCenter,
                          height: 20,
                          color: Colors.white,
                          child: const FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'Visibilité et eclairage',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
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