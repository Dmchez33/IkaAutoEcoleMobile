import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';

import 'DetailCours.dart';

class cours extends StatefulWidget {
  const cours({Key? key}) : super(key: key);

  @override
  _coursState createState() => _coursState();
}

class _coursState extends State<cours> {
  final List<Map<String,String>> test = [
    {"text":"Partage de la route",
      "url":"partage de la route.jpg"
      },
    {"text":"Panneau de signalisation",
      "url":"panneau_de_signal.jpg"
      },
    {"text":"Notion théoriques et pratiques",
      "url":"notion_theorie.png"
      },
    {
      "text":"Priorités",
      "url":"priorite.PNG"
    },
    {
      "text":"Regle a la circulation",
      "url":"regle.png"
    },
    {
      "text":"Prise de conscience",
      "url":"regle.png"
    }

  ];
  final List<String> url = [
    "partage de la route.jpg",
    "panneau_de_signal.jpg",
    "notion_theorie.png",
    "priorite.PNG",
    "regle.png",
    "regle.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 30,
        backgroundColor: Color(0xFF1A237E),
        centerTitle: true,
        title: const Text('Cours'),
        actions: [Image.asset('assets/images/logoIkaAutoEcole.png')],
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
                        onTap: () { Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailCoursPage(),
                          ),
                        ); },
                        child: Stack(
                          children: [
                            Container(
                                child: Image.asset(
                              "assets/images/imagecours/partage de la route.jpg",
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
                                        'Partage de la route',
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
              height: 60,
              animation: false,
              viewportFraction: 0.60,
              showIndicator: true,
              customizedBanners: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/imagecours/regle.png'),
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
                                'Notion théoriques et pratiques',
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
