
import 'package:flutter/material.dart';
import 'package:ika_auto_ecole/Model/TypePanneaux.dart';
import 'package:ika_auto_ecole/Pages/Cours/ListeCoursParContenu.dart';
import 'package:ika_auto_ecole/Provider/AutoecoleDataProvider.dart';
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



  getAllTypePanneaux() async {
    typePanneaux = await typePanneauxService.getAllPanneaux();
    Provider.of<AutoecoleDataProvider>(context, listen: false).typePanneaux =
        typePanneaux!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (typePanneaux == null) {
      return Scaffold(
        appBar:AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF1A237E),
          centerTitle: true,
          title: const Text('Panneaux'),
          automaticallyImplyLeading: false, // cacher l'icône de retour
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
        body: Column(
          children: [
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF1A237E),
              /*child: ClipPath(
                clipper: BottomArcClipper(),
                child: Container(
                  color: Color(0xFF1A237E),
                ),
              ),*/
            ),
            const Center(

              child: CircularProgressIndicator(),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // cacher l'icône de retour
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
                height: 60,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFF1A237E),
               /* decoration: BoxDecoration(
                  color: Color(0xFF1A237E),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),*/
                /*child: ClipPath(
                  clipper: BottomArcClipper(),
                  child: Container(
                    color: Color(0xFF1A237E),
                  ),
                ),*/
              ),
              Expanded(
                child: Container(
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(10),
                      crossAxisSpacing: 15,
                      // marge vertical entre les elements
                      mainAxisSpacing: 1,
                      // marge horizontal entre les elements
                      crossAxisCount: 2,
                      // nombre d'elements par ligne
                      shrinkWrap: true,
                      children: [

                        for (int i = 0; i < typePanneaux!.length; i++) ...[
                          Container(
                            decoration: BoxDecoration(

                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF1A237E).withOpacity(0.3),
                                  //spreadRadius: 5,
                                  blurRadius: 4,
                                  offset: Offset(2, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Card(
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
}
