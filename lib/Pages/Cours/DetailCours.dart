import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../Compte/compte.dart';

class DetailCoursPage extends StatefulWidget {
  const DetailCoursPage({Key? key}) : super(key: key);

  @override
  _DetailCoursPageState createState() => _DetailCoursPageState();
}

class _DetailCoursPageState extends State<DetailCoursPage> {
  late VideoPlayerController controller;

  late VideoPlayerController controlleraudio;
  @override
  void initState() {
    loadVideoPlayer();
    loadAudioPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    controller = VideoPlayerController.asset(
        'assets/audio/panneaux.mp4');
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  loadAudioPlayer() {
    controlleraudio = VideoPlayerController.asset(
        'assets/audio/vocal1.mp3');
    controlleraudio.addListener(() {
      setState(() {});
    });
    controlleraudio.initialize().then((value) {
      setState(() {});
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

      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              //height: MediaQuery.of(context).size.height * 0.15,
              child: Image.asset(
                'assets/cours/image1.png',
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //DEBUT DE PLACE DE LA VIDEO
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          //ECRAN OU ON PEUT VISUALISER LA VIDEO
                          AspectRatio(
                            aspectRatio: controller.value.aspectRatio,
                            child: VideoPlayer(controller),
                          ),

                          //INDICATEUR DE LA progression de la video
                          Container(
                              child: VideoProgressIndicator(controller,
                                  allowScrubbing: false,
                                  colors: const VideoProgressColors())),
                          //CONTENEUR CONTENANT LE BUTTON PLAY PAUSE  DE LA VIDEO
                          Container(
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      if (controller.value.isPlaying) {
                                        controller.pause();
                                      } else {
                                        controller.play();
                                      }

                                      setState(() {});
                                    },
                                    icon: Icon(controller.value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow)),
                                IconButton(
                                    onPressed: () {
                                      controller.seekTo(Duration(seconds: 0));

                                      setState(() {});
                                    },
                                    icon: Icon(Icons.stop))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    //FIN DE LA PLACE DE LA VIDEO

                    //DEBUT DE LA PLACE DE L'IMAGE
                    Column(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 20,left: 20),
                          child: Image.asset(
                            "assets/images/imagecours/notion_theorie.png",
                            //width: MediaQuery.of(context).size.width * .4,
                            fit: BoxFit.fill,
                            //height: MediaQuery.of(context).size.height,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.all(20),
                            child: const Text(
                              "L’arrêt est l’immobilisation momentanée d’un véhicule pour permettre : La montée ou descente de passagers, Le chargement ou le dechargement d’objets. Le conducteur doit rester près de la véhicule pour être en mesure de le deplacer en cas de besoin.",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.justify,
                            )),


                      ],
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
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
      ),
    );
  }
}

