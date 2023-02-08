import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong2/latlong.dart" as latLng;
import 'package:shared_preferences/shared_preferences.dart';

import '../Compte/Connexion.dart';
import '../utilities/keys.dart';

import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
class DetailLieuxMap extends StatefulWidget {
  const DetailLieuxMap({Key? key}) : super(key: key);

  @override
  State<DetailLieuxMap> createState() => _DetailLieuxMapState();
}

class _DetailLieuxMapState extends State<DetailLieuxMap> {
  final List<String> image = [
    "ima1.png",
    "ima2.png",
    "ima3.png"
  ];

  bool _isPlaying = true;

  late CarouselSliderController _sliderController;


  late SharedPreferences sharedPreferences;
  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
    _sliderController.setAutoSliderEnabled(_isPlaying);

    checkLoginStatus();

    playAudioWelCome = false;


  }

  //CONNECTION DE L4UTILISATEUR
  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isLoggedIn = sharedPreferences.getBool("isLoggedIn")!;
    if(isLoggedIn){
      showModalReservation = true;
      print(showModalReservation);
    }else{
      showModalReservation = false;
      print(showModalReservation);
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF1A237E),
        centerTitle: true,
        title: const Text('Detail Lieux'),

      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 35,
            decoration: const BoxDecoration(
              color: Color(0xFF1A237E),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),

          ),
          Expanded(child: SingleChildScrollView(
            child: Column(children: [
              //CONTENAIRE CONTENANT LE CONTACT DE L'UTILISATEUR
              Container(
                margin: const EdgeInsets.all(10),
                child: Card(
                  child: ListTile(
                    leading: Image.asset("assets/images/kanaga.jpg"),
                    title: Container(
                        margin: const EdgeInsets.only(left: 100, bottom: 5),
                        child: const Text("Contact", style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),)
                    ),
                    subtitle: Container(
                      margin: const EdgeInsets.only(left: 70),
                      child: Column(

                        children: [
                          Row(
                            children: const [
                              Icon(Icons.phone),
                              SizedBox(
                                width: 10,
                              ),
                              Text("20 23 01 02"),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(Icons.phone),
                              SizedBox(
                                width: 10,
                              ),
                              Text("66 73 01 99"),
                            ],
                          )


                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //CONTAINER CONTENANT LE LA LOCALISATION DE L'AUTOECOLE
              Container(
                //margin: const EdgeInsets.only(top: 5),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        alignment: Alignment.centerLeft,
                        decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(
                              width: 5.0, color: Colors.black)),
                        ),
                        child: const Text("Localisation", style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                      ),
                      Container(
                        height: 200,
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        child: FlutterMap(
                          options: MapOptions(
                            center: latLng.LatLng(
                                12.583544210146679, -8.020347027831903),
                            zoom: 13.0,
                            minZoom: 5.0,
                            maxZoom: 20.0,
                          ),
                          children: [
                            TileLayer(
                                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                subdomains: ['a', 'b', 'c']
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  width: 80.0,
                                  height: 80.0,
                                  point: latLng.LatLng(
                                      12.583544210146679, -8.020347027831903),
                                  builder: (ctx) =>
                                      Column(
                                        children: [
                                          Text("Auto Ecole Kanaga",
                                            style: TextStyle(
                                                color: Colors.red),),
                                          Container(
                                            child: const Icon(
                                                Icons.location_on),
                                          ),
                                        ],
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),

                      )
                    ],
                  )
              ),

              //CONTENAIRE PERMETTANT DE FAIRE LA RESERVATION
              Container(
                //margin: const EdgeInsets.only(top: 5),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        alignment: Alignment.centerLeft,
                        decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(
                              width: 5.0, color: Colors.black)),
                        ),
                        child: const Text(
                          "Cours de conduite dispensés", style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                      ),
                      Card(
                        child: ListTile(
                          leading: Image.asset("assets/images/voiture.webp"),
                          title: Text("Automobile (B)"),
                          trailing: ElevatedButton(
                            onPressed: () {
                              btn1(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF6200EE)),
                            child: Text("Reserver"),
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Image.asset("assets/images/moto.png"),
                          title: Text("Moto/Cyclomoteur (A)"),
                          trailing: ElevatedButton(onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF6200EE)),
                            child: Text("Reserver"),
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                            leading: Image.asset("assets/images/voiture.webp"),
                            title: Text("Transport de personnes (D)"),
                            trailing: FutureBuilder(
                              future: _checkUser(),
                              builder: (BuildContext context, AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return snapshot.data;
                                }
                                return CircularProgressIndicator();
                              },
                            ),
                        ),
                      )

                    ],
                  )
              ),
//CONTENAIRE PERMETTANT DE VOIR LES
              Container(
                //margin: const EdgeInsets.only(top: 5),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        alignment: Alignment.centerLeft,
                        decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(
                              width: 5.0, color: Colors.black)),
                        ),
                        child: const Text(
                          "Nos véhicules pour la formation", style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                      ),

                    ],
                  )
              ),
            ],),
          ))
        ],
      ),
    );
  }


  //utilisation des modal dialog
  Widget btn1(BuildContext context) {
    return MaterialButton(
      color: Color(0xFF6200EE),
      //minWidth: 50,
      onPressed: () =>
          Dialogs.materialDialog(
              msg: 'Are you sure ? you can\'t undo this',
              title: "Delete",
              color: Colors.white,
              context: context,
              dialogWidth: kIsWeb ? 0.3 : null,
              onClose: (value) => print("returned value is '$value'"),
              actions: [
                IconsOutlineButton(
                  onPressed: () {
                    Navigator.of(context).pop(['Test', 'List']);
                  },
                  text: 'Annuler',
                  iconData: Icons.cancel_outlined,
                  textStyle: TextStyle(color: Colors.grey),
                  iconColor: Colors.grey,
                ),
                IconsButton(
                  onPressed: () {},
                  text: "Envoyer",
                  //iconData: Icons.delete,
                  color: Color(0xFF6200EE),
                  textStyle: TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                ),
              ]),
      child: Text("Reserver", style: TextStyle(color: Colors.white),),
    );
  }


  Widget btn3(BuildContext context) {
    return MaterialButton(
      //minWidth: 300,
      color:Color(0xFF6200EE),
      onPressed: () =>
          Dialogs.materialDialog(
            color: Colors.white,
            msg: 'Veuillez vous connecter pour pouvoir réserver des cours.',
            title: 'Alerte',
            /*lottieBuilder: Lottie.asset(
          'assets/cong_example.json',
          fit: BoxFit.contain,
        ),*/
            dialogWidth: kIsWeb ? 0.3 : null,
            context: context,
            actions: [
              IconsButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: 'Ok',
                iconData: Icons.done,
                color: Color(0xFF1A237E),
                textStyle: TextStyle(color: Colors.white),
                iconColor: Colors.white,
              ),
            ],
          ),
      child: Text("Reserver",style: TextStyle(color: Colors.white),),
    );
  }

  Future<Widget> _checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    if (isLoggedIn) {
      return btn1(context);
    }
    return btn3(context);
  }
}