import 'package:flutter/material.dart';
import 'package:ika_auto_ecole/Pages/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utilities/keys.dart';
import 'Connexion.dart';
import 'Inscription.dart';

class compte extends StatefulWidget {
  const compte({Key? key}) : super(key: key);

  @override
  _compteState createState() => _compteState();
}

class _compteState extends State<compte> {
  //INFORMATIONS CONCERNANT LES INFORMATION DE L'UTILISATEUR CONNECTER
  late SharedPreferences sharedPreferences;

  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();

    //pour mettre en pause audiowelcom
    playAudioWelCome = false;
  }


  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isLoggedIn = sharedPreferences.getBool("isLoggedIn")!;

    print(isLoggedIn);
    if (sharedPreferences.getString("accessToken") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
              (Route<dynamic> route) => false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  "Profile",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Tab(
                  child: Text(
                "Statistique",
                style: TextStyle(fontSize: 18),
              )),
            ],
          ),
          backgroundColor: const Color(0xFF1A237E),
          centerTitle: true,
          title: const Text(
            'Compte',
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder(
              future: _checkUser(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data;
                }
                return CircularProgressIndicator();
              },
            ),

            Container(
              child:
              Center(
                child: Text("Encours de Conception"),
              ),
            )
          ],
        ),
      ),
    );
  }

  //VERIFICATION DE LA CONNXION D'UN UTILISATEUR
  Future<Widget> _checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    if (isLoggedIn) {
      return Column(
        children: [

          Container(
              child: Image.asset(
                "assets/images/imageMap/image2.png",

              )),


          Column(
            children: [

              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width *.4,
                    margin: const EdgeInsets.only(left: 10),
                    child: const Text(

                      "Nom",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold,letterSpacing: 2),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *.4,
                    child: const Text("DEMBELE",style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400,letterSpacing: 1)),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width *.4,
                    margin: const EdgeInsets.only(left: 10),
                    child: const Text(

                      "Prénom",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold,letterSpacing: 2),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *.4,
                    child: const Text("Idrissa",style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400,letterSpacing: 1)),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),

              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width *.4,
                    margin: const EdgeInsets.only(left: 10),
                    child: const Text(

                      "Téléphone",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold,letterSpacing: 2),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *.4,
                    child: const Text("83252448",style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400,letterSpacing: 1)),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width *.4,
                    margin: const EdgeInsets.only(left: 10),
                    child: const Text(

                      "Email",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold,letterSpacing: 2),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *.4,
                    child: const Text("iddembele206@gmail.com",style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400,letterSpacing: 1)),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              /*Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width *.4,
                    margin: const EdgeInsets.only(left: 10, ),
                    child: const Text(
                      "Niveau:",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold,letterSpacing: 2),
                    ),
                  )
                  SizedBox(
                    width: MediaQuery.of(context).size.width *.5,
                    child: Row(
                      children: const [
                        Text("Débutant",style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400,letterSpacing: 1)),
                        Icon(Icons.star, color: Color(0xFF6200EE),),
                        Icon(Icons.star, color: Color(0xFF6200EE),)
                      ],
                    ),
                  )
                ],
              ),*/
              const SizedBox(
                height: 25,
              ),

              Container(
                width: MediaQuery.of(context).size.width *.8,
                height: 35,
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6200EE)
                  ),
                  onPressed: () {
                    sharedPreferences.clear();
                    sharedPreferences.commit();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) => MainPage()),
                            (Route<dynamic> route) => false);
                  },
                  child: Text("Déconnecter"),
                ),
              )
            ],
          ),
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        SizedBox(
          width: 200,
          height: 45,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6200EE)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Incription(),
                  ),
                );
              },
              child: const Text("INSCRIPTION",
                  style:
                  TextStyle(fontFamily: "Poppins", fontSize: 16))),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 200,
          height: 45,
          child: ElevatedButton(

              style: ElevatedButton.styleFrom(

                backgroundColor: Color(0xFF6200EE),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: const Text("J'AI DEJA UN COMPTE",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      color: Color(0xFFFFFFFF)))),
        ),
      ],
    );
  }
}
