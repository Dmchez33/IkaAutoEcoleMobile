import 'package:audioplayer/audioplayer.dart';
import 'package:circular_image/circular_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ika_auto_ecole/Model/Adresse.dart';
import 'package:ika_auto_ecole/Pages/map/DetailLieuxMap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

import '../../Model/AutoEcole.dart';
import '../../Provider/AutoecoleDataProvider.dart';
import '../../Service/AdresseService.dart';
import '../Compte/Connexion.dart';
import '../Compte/compte.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import '../utilities/keys.dart';

class localisation extends StatefulWidget {
  const localisation({Key? key}) : super(key: key);

  @override
  _localisationState createState() => _localisationState();
}

class _localisationState extends State<localisation> {
  late Object _selectedRegion = 'Badalabougou';
  final ScrollController _controller = ScrollController();

  //Future<List<AutoEcole>> _autoEcoles = [];

  //POUR L'ADRESSE
  AdresseService adresses = AdresseService();
  List<Adresses>? adresse;
  Adresses? adres;


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

  // DEBUT POUR L'AUDIO DE BIENVENU
  late VideoPlayerController controlleraudio;

  loadAudioPlayer() {
    controlleraudio = VideoPlayerController.asset('assets/audio/bienvenu.mp3');
    controlleraudio.addListener(() {
      setState(() {});
    });
    controlleraudio.initialize().then((value) {
      setState(() {});
    });
  }

  // FIN POUR L'AUDIO

  AudioPlayer _audioPlayer = AudioPlayer();
  getAdresse() async{
    adresse = await adresses.getAllAdresses();
    Provider.of<AutoecoleDataProvider>(context, listen: false).adresses = adresse!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    getAdresse();
    showWidget = true;
    print("bonjour");

    //POUR AUDIO
    if (playAudioWelCome) {
      loadAudioPlayer();
      super.initState();
      controlleraudio.play();
      playAudioWelCome = false;
    }

    //_audioPlayer.play("assets/audio/bienvenu.mp3");
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

  bool _played = false;

  @override
  Widget build(BuildContext context) {
    /*if (!_played) {
      _played = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controlleraudio.play();
      });
    }*/
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF1A237E),
          centerTitle: true,
          title: const Text('Accueil'),
          automaticallyImplyLeading: false, // cacher l'icône de retour

          actions: <Widget>[

            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1A237E)),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const compte()),
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
              height: 205,
              decoration: const BoxDecoration(
                color: Color(0xFF1A237E),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
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
                        height: 44,
                        width: MediaQuery.of(context).size.width * .7,
                        child: Consumer<AutoecoleDataProvider>(
                          builder: (context, AutoecoleDataProvider, child) => DropdownSearch<Adresses>(
                           // mode: Mode.MENU,
                            selectedItem: adres,
                            dropdownDecoratorProps: const DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                icon: Icon( Icons.fmd_good_outlined),
                                //labelText: "Selectionner un quartier",
                                //hintText: "Select an Int",
                              ),
                            ),
                            //label: "Sélectionnez une adresse",
                            //hint: "Sélectionnez une adresse",
                            items: AutoecoleDataProvider.adresses,
                            itemAsString: (Adresses adresse) => adresse.quartier!,
                            onChanged: (value) {
                              setState(() {
                                print(value);
                                adres = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  /*Row(
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
                        child: Consumer<AutoecoleDataProvider>(
                          builder: (context, AutoecoleDataProvider, child) => DropdownButton(
                            icon: Container(
                              margin: const EdgeInsets.only(left: 120),
                              //width: MediaQuery.of(context).size.width *.5,
                              alignment: Alignment.centerLeft,
                              child: const Icon(Icons.arrow_drop_down),
                            ),
                            value: _selectedRegion,
                            items: AutoecoleDataProvider.adresses.map((Adresses adresse) {
                              return DropdownMenuItem(
                                value: adresse.quartier,
                                child: Text("${adresse.telephone}"),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                print(value);
                                _selectedRegion = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),*/
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
                          JelloIn(
                            duration: const Duration(milliseconds: 5000),
                            child: Image.asset(
                              "assets/images/imageMap/image2.png",
                              width: 300,
                            ),
                          ),
                          Row(
                            children: [
                              Spin(
                                spins: 1,
                                duration: const Duration(milliseconds: 2000),
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 5, right: 5, top: 15),
                                  width:
                                      MediaQuery.of(context).size.width * .45,
                                  height:
                                      MediaQuery.of(context).size.height * .25,
                                  child: Card(
                                    elevation: 2,
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/imageMap/trouver.png",
                                          width: 60,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Pour que tu puisse trouver les auto-écoles les plus proches de votre adresse.",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              FadeInUp(
                                duration: const Duration(milliseconds: 2000),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 5, top: 15),
                                  width:
                                      MediaQuery.of(context).size.width * .50,
                                  height:
                                      MediaQuery.of(context).size.height * .25,
                                  child: Card(
                                    elevation: 2,
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/imageMap/progression.png",
                                          width: 60,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Pour que tu puisse suivre ta progression en effectuant nos differents quiz",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                                    builder: (context) =>
                                        const DetailLieuxMap(),
                                  ),
                                );
                              },
                              child: ListTile(
                                leading: CircularImage(
                                    radius: 20,
                                    borderWidth: 1,
                                    borderColor: Colors.white,
                                    source: 'assets/images/kanaga.jpg'),
                                title: const Text(
                                  "Auto ecole Kanaga",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.justify,
                                ),
                                subtitle: const Text('20 23 01 02 / 66 73 01 99'),
                              ),
                            ),
                          ),
                          Card(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: ListTile(
                                leading: CircularImage(
                                  radius: 20,
                                  borderWidth: 1,
                                  borderColor: Colors.white,
                                  source:
                                      "assets/images/imageMap/progression.png",
                                ),
                                title: const Text(
                                  "Auto ecole Tigana",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.justify,
                                ),
                                subtitle: const Text('76 55 23 23 / 63 63 63 51'),
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
        )
        /*floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controlleraudio.value.isPlaying) {
            controlleraudio.pause();
          } else {
            controlleraudio.play();
          }
          setState(() {});

        },
        child: Icon(controlleraudio.value.isPlaying
            ? Icons.pause
            : Icons.play_arrow),
      ),*/
        );
  }
}
