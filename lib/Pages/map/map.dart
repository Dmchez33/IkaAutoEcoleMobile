import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:circular_image/circular_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:ika_auto_ecole/Pages/map/DetailLieuxMap.dart';
import 'package:ika_auto_ecole/Pages/map/listeLieux.dart';
import 'package:select_searchable_list/select_searchable_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Compte/Connexion.dart';
import '../Compte/compte.dart';

class localisation extends StatefulWidget {
  const localisation({Key? key}) : super(key: key);

  @override
  _localisationState createState() => _localisationState();
}

class _localisationState extends State<localisation> {
  late String _selectedRegion = 'Badalabougou';
  List<String> _regions = [
    'Badalabougou',
    'Niamana',
    'Daoudabougou',
    'ACI 200'
  ];

  //MAP
  late SharedPreferences sharedPreferences;
  bool isLoggedIn = false;
  bool showWidget = true;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    showWidget = true;
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isLoggedIn = sharedPreferences.getBool("isLoggedIn")!;

    if (sharedPreferences.getString("accessToken") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF1A237E),
        centerTitle: true,
        title: const Text('Accueil'),
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
            width: double.infinity,
            height: 250,
            decoration: const BoxDecoration(
              color: Color(0xFF1A237E),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "Cliquez pour trouver l'auto-école près de chez vous et réservez vos cours dès maintenant !",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(10),
                      child: const Icon(
                        Icons.fmd_good_outlined,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.only(top: 20),
                      height: 44,
                      width: MediaQuery.of(context).size.width * .7,
                      child: DropdownButton(
                        icon: Container(
                          margin: const EdgeInsets.only(left: 120),
                          //width: MediaQuery.of(context).size.width *.5,
                          alignment: Alignment.centerLeft,
                          child: const Icon(Icons.arrow_drop_down),
                        ),
                        value: _selectedRegion,
                        items: _regions.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedRegion = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .7,
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6200EE)),
                    child: const Text('Rechercher'),
                    onPressed: () {
                      // handle search here
                      setState(() {
                        showWidget = false;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (showWidget) ...[
                    Column(
                      children: <Widget>[
                        const Text(
                          "Pour quoi avons nous créé cette application ?",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          child: Image.asset(
                            "assets/images/imageMap/image2.png",
                            width: 300,
                          ),
                        ),
                        ListTile(
                          leading: Image.asset(
                            "assets/images/imageMap/trouver.png",
                            width: 60,
                          ),
                          title: const Text(
                            "Pour que tu puisse trouver les auto-écoles les plus proches de votre adresse.",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        ListTile(
                          trailing: Image.asset(
                            "assets/images/imageMap/progression.png",
                            width: 60,
                          ),
                          title: const Text(
                            "Pour que tu puisse suivre ta progression en effectuant nos differents quiz",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ] else ...[
                    Container(
                        child: Column(
                      children: [
                        Card(

                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DetailLieuxMap(),
                                ),
                              );
                            },
                            child: ListTile(
                              leading:CircularImage(radius:20, borderWidth:1,borderColor:Colors.white, source: 'assets/images/imageMap/progression.png'),
                              title: const Text(
                                "Auto ecole Kanaga",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.justify,
                              ),
                              subtitle: Text('20 23 01 02 / 66 73 01 99'),
                            ),
                          ),
                        ),
                        
                        Card(
                          child: ElevatedButton(

                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {  },
                            child: ListTile(
                              leading: CircularImage(
                                radius:20, borderWidth:1,borderColor:Colors.white,
                                source:"assets/images/imageMap/progression.png",


                              ),
                              title: const Text(
                                "Auto ecole Tigana",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.justify,
                              ),
                              subtitle: Text('76 55 23 23 / 63 63 63 51'),
                            ),
                          ),
                        )
                      ],
                    ))
                  ],
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
