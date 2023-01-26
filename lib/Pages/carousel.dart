import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:ika_auto_ecole/Pages/Compte/Inscription.dart';

import 'Compte/Connexion.dart';
import 'HomePage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> image = [
    "ima1.png",
    "ima2.png",
    "ima3.png"
  ];

  bool _isPlaying = true;

  late CarouselSliderController _sliderController;

  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
    _sliderController.setAutoSliderEnabled(_isPlaying);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Color(0xFF1A237E),
          height: MediaQuery.of(context).size.height * 0.60,
          child: CarouselSlider.builder(
            unlimitedMode: true,
            controller: _sliderController,
            slideBuilder: (index) {
              return Container(
                child: Image.asset(
                  "assets/carousel/${image[index]}",
                  //fit: BoxFit.fill,
                ),
              );
            },
            slideTransform: CubeTransform(),
            slideIndicator: CircularSlideIndicator(
                padding: EdgeInsets.only(top: 320),
                indicatorBorderColor: Colors.white,
                indicatorBackgroundColor: Colors.white),
            itemCount: image.length,
            initialPage: 0,
            enableAutoSlider: true,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.35,
          color: Color(0xFF1A237E),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
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
                        backgroundColor: Color(0xFFFFFFFF),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Connexion(),
                          ),
                        );
                      },
                      child: const Text("J'AI DEJA UN COMPTE",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16,
                              color: Color(0xFF6200EE)))),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20, top: 15),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyStatefulWidget()),
                        );
                      },
                      child: const Text("PLUS TARD",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16,
                              color: Colors.white))),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
