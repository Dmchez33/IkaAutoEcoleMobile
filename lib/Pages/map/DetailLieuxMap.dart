import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:ika_auto_ecole/Service/AdresseService.dart';
import "package:latlong2/latlong.dart" as latLng;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Model/AutoEcole.dart';
import '../../Provider/AutoecoleDataProvider.dart';
import '../Compte/Connexion.dart';
import '../Reservation.dart';
import '../utilities/keys.dart';

import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class DetailLieuxMap extends StatefulWidget {
  const DetailLieuxMap({Key? key, this.id}) : super(key: key);
  final int? id;
  @override
  State<DetailLieuxMap> createState() => _DetailLieuxMapState();
}

class _DetailLieuxMapState extends State<DetailLieuxMap> {
  final List<String> image = ["ima1.png", "ima2.png", "ima3.png"];

  bool _isPlaying = true;

  late CarouselSliderController _sliderController;

  //DETAIT DE AUTOECOLE LES ATTRIUT
  AdresseService adresses = AdresseService();
  AutoEcole? autoEcole;

  

  late SharedPreferences sharedPreferences;
  bool isLoggedIn = false;
  
  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
    _sliderController.setAutoSliderEnabled(_isPlaying);
    getAutoEcoleById();
    // checkLoginStatus();

    playAudioWelCome = false;
  }

  //Methode permettan une autoecole par id
  getAutoEcoleById() async {
    autoEcole = await adresses.getAutoEcoleById(widget.id);
    Provider.of<AutoecoleDataProvider>(context, listen: false).autoecolebyid =
        autoEcole;
    setState(() {});
  }

  //CONNECTION DE L4UTILISATEUR
  // checkLoginStatus() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   isLoggedIn = sharedPreferences.getBool("isLoggedIn")!;
  //   if(isLoggedIn){
  //     showModalReservation = true;
  //     print(showModalReservation);
  //   }else{
  //     showModalReservation = false;
  //     print(showModalReservation);
  //   }

  // }

  @override
  Widget build(BuildContext context) {
    if (autoEcole == null) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF1A237E),
          centerTitle: true,
          title: const Text('Detail Lieux'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
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
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  //CONTENAIRE CONTENANT LE CONTACT DE L'UTILISATEUR

                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Card(
                      child: ListTile(
                        leading: Image.asset("assets/images/kanaga.jpg"),
                        title: Container(
                            margin: const EdgeInsets.only(left: 100, bottom: 5),
                            child: const Text(
                              "Contact",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )),
                        subtitle: Container(
                          margin: const EdgeInsets.only(left: 70),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Téléphone",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      launch("tel:${autoEcole!.telephone}");
                                    },
                                    child: InkWell(
                                      child: Text("${autoEcole!.telephone}"),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Rue:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text("${autoEcole!.rue}"),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Porte:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text("${autoEcole!.porte}"),
                                ],
                              ),
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
                          border: Border(
                              bottom:
                                  BorderSide(width: 5.0, color: Colors.black)),
                        ),
                        child: const Text(
                          "Localisation",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Container(
                        height: 200,
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        child: FlutterMap(
                          options: MapOptions(
                            center: latLng.LatLng(
                                double.parse(
                                    '${autoEcole!.adresses![0].latitude}'),
                                double.parse(
                                    '${autoEcole!.adresses![0].longitude}')),
                            zoom: 13.0,
                            minZoom: 5.0,
                            maxZoom: 20.0,
                          ),
                          children: [
                            TileLayer(
                                urlTemplate:
                                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                subdomains: ['a', 'b', 'c']),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  width: 80.0,
                                  height: 80.0,
                                  point: latLng.LatLng(
                                      double.parse(
                                          '${autoEcole!.adresses![0].latitude}'),
                                      double.parse(
                                          '${autoEcole!.adresses![0].longitude}')),
                                  builder: (ctx) => Column(
                                    children: [
                                      Text(
                                        "${autoEcole!.nom}",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      Container(
                                        child: const Icon(Icons.location_on),
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
                  )),

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
                          border: Border(
                              bottom:
                                  BorderSide(width: 5.0, color: Colors.black)),
                        ),
                        child: const Text(
                          "Cours de conduite dispensés",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      for (int i = 0;
                          i < autoEcole!.typeCours!.length;
                          i++) ...[
                        Card(
                          child: ListTile(
                            leading: Image.network(
                                "${autoEcole!.typeCours![i].image}"),
                            title: Text("${autoEcole!.typeCours![i].nomcours}"),
                            trailing: FutureBuilder(
                              future: _checkUser(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return snapshot.data;
                                }
                                return CircularProgressIndicator();
                              },
                            ),
                          ),
                        )
                      ],
                      // Card(
                      //   child: ListTile(
                      //     leading: Image.asset("assets/images/voiture.webp"),
                      //     title: Text("Automobile (B)"),
                      //     trailing: ElevatedButton(
                      //       onPressed: () {
                      //         btn1(context);
                      //       },
                      //       style: ElevatedButton.styleFrom(
                      //           backgroundColor: Color(0xFF6200EE)),
                      //       child: Text("Reserver"),
                      //     ),
                      //   ),
                      // ),
                      // Card(
                      //   child: ListTile(
                      //     leading: Image.asset("assets/images/moto.png"),
                      //     title: Text("Moto/Cyclomoteur (A)"),
                      //     trailing: ElevatedButton(
                      //       onPressed: () {},
                      //       style: ElevatedButton.styleFrom(
                      //           backgroundColor: Color(0xFF6200EE)),
                      //       child: Text("Reserver"),
                      //     ),
                      //   ),
                      // ),
                    ],
                  )),
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
                          border: Border(
                              bottom:
                                  BorderSide(width: 5.0, color: Colors.black)),
                        ),
                        child: const Text(
                          "Nos véhicules pour la formation",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      for (int i = 0;
                          i < autoEcole!.vehicules!.length;
                          i++) ...[
                        Card(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Image.network(
                                  "${autoEcole!.vehicules![i].image}",
                                  width: MediaQuery.of(context).size.width * .4,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Marque",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                        "${autoEcole!.vehicules![i].marquevehicule}",
                                        style: TextStyle(fontSize: 16)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Type",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                        "${autoEcole!.vehicules![i].typevehicule}",
                                        style: TextStyle(fontSize: 16))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ],
                  )),
                ],
              ),
            ))
          ],
        ),
      );
    }
  }

  //MODAL COTENANT LES CHAMPS DE SELECTION DE DATE ET DE HORAIRE
  Widget btn1(BuildContext context) {
    return MaterialButton(
      color: Color(0xFF6200EE),
      //minWidth: 50,
      onPressed: () => Dialogs.materialDialog(
          msg: 'Êtes vous sûre de vouloir reserver',
          title: "Confirmation",
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
      child: Text(
        "Reserver",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  //utilisation des modal dialog

  Widget btn3(BuildContext context) {
    return MaterialButton(
      //minWidth: 300,
      color: Color(0xFF6200EE),
      onPressed: () => Dialogs.materialDialog(
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
      child: Text(
        "Reserver",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Future<Widget> _checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    if (isLoggedIn) {
      return SuccessDialog();
    }
    return btn3(context);
  }
}

class SuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Color(0xFF6200EE),
      onPressed: () {
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text(
                'Merci de sélectionner la date et l\'heure qui vous conviennent pour votre réservation. ',
                textAlign: TextAlign.justify,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [ReservationScreen()],
              ),
            );
          },
        );
      },
      child: Text(
        "Reserver",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
