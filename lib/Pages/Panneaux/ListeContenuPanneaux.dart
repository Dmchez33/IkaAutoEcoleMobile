import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Model/Panneaux.dart';
import '../../Provider/AutoecoleDataProvider.dart';
import '../../Service/PanneauxService.dart';
import '../Cours/DetailCours.dart';

class LiteContenuPanneaux extends StatefulWidget {
  final String? nomTypePanneaux;
   LiteContenuPanneaux({Key? key, required this.nomTypePanneaux}) : super(key: key);

  @override
  State<LiteContenuPanneaux> createState() => _LiteContenuPanneauxState();
}

class _LiteContenuPanneauxState extends State<LiteContenuPanneaux> {
  //LES ELEMENTS DU COURS
  PanneauxService panneauxService = PanneauxService();
  List<PanneauDeConduite>? panneaux;

  @override
  void initState() {
    super.initState();
    getAllPanneauxByType();
  }

  getAllPanneauxByType() async {
    panneaux = await panneauxService.getAllPanneauxByType(widget.nomTypePanneaux);
    Provider.of<AutoecoleDataProvider>(context, listen: false)
        .panneauDeConduite = panneaux!;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF1A237E),
        centerTitle: true,
        title: const Text('Cours'),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          BannerCarousel(
            //height: 110,
            animation: true,
            viewportFraction: 0.8,
            showIndicator: true,
            spaceBetween: 1.0,
            customizedBanners: [
              for(int i=0; i<panneaux!.length; i++)...[
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
                        image:  DecorationImage(
                          image: NetworkImage(
                              "${panneaux![i].image}"),
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
                          child:  FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                '${panneaux![i].nom}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))),
                    ),
                  ],
                ),
              ]

            ],
          ),
        ],
      ),
    );
  }
}

class BottomArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
