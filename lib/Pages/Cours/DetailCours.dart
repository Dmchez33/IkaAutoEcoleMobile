import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../Compte/compte.dart';
import '../Quiz/SeletedQuestionPage.dart';
import '../utilities/keys.dart';

import '../../Model/course.dart';
import 'package:provider/provider.dart';

import '../../Provider/AutoecoleDataProvider.dart';
import '../../Service/CoursService.dart';
class DetailCoursPage extends StatefulWidget {
  final int? idContenu;
  DetailCoursPage({Key? key, required this.idContenu}) : super(key: key);

  @override
  _DetailCoursPageState createState() => _DetailCoursPageState();
}

class _DetailCoursPageState extends State<DetailCoursPage> {
  late VideoPlayerController controller;

  late VideoPlayerController controlleraudio;

  //COurs contenu
  CoursService coursService = CoursService();
  List<contenuCours>? contenu;

  getAllCours() async {
    print(widget.idContenu);
    contenu = await coursService.getAllContenu(widget.idContenu);
    Provider
        .of<AutoecoleDataProvider>(context, listen: false)
        .contenu = contenu!;
    setState(() {

    });
  }
  @override
  void initState() {
    loadVideoPlayer();
    loadAudioPlayer();
    super.initState();
    getAllCours();
    playAudioWelCome = false;

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
    if(contenu == null){
      return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xFF1A237E),
            centerTitle: true,
            title: const Text('Detail cours'),

          ),
          body: Column(

              children:  [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ClipPath(
                    clipper: BottomArcClipper(),
                    child: Container(
                      color: Color(0xFF1A237E),
                    ),
                  ),
                ),
                const Center(
                  child: CircularProgressIndicator(),
                ),
              ]
          )
      );
    }else{
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF1A237E),
          centerTitle: true,
          title: const Text('Detail cours'),

        ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: ClipPath(
                  clipper: BottomArcClipper(),
                  child: Container(
                    color: Color(0xFF1A237E),
                  ),
                ),
              ),
              /*Container(
              width: double.infinity,
              //height: MediaQuery.of(context).size.height * 0.15,
              child: Image.asset(
                'assets/cours/image1.png',
                fit: BoxFit.fill,
              ),
            ),*/
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
                            /*AspectRatio(
                            aspectRatio: controller.value.aspectRatio,
                            child: VideoPlayer(controller),
                          ),*/

                            //INDICATEUR DE LA progression de la video
                            /*Container(
                              child: VideoProgressIndicator(controller,
                                  allowScrubbing: false,
                                  colors: const VideoProgressColors())),*/
                            //CONTENEUR CONTENANT LE BUTTON PLAY PAUSE  DE LA VIDEO
                            /*Container(
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
                          ),*/
                          ],
                        ),
                      ),

                      //FIN DE LA PLACE DE LA VIDEO

                      //DEBUT DE LA PLACE DE L'IMAGE
                      Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for(int i=0; i<contenu!.length; i++)...[
                            Container(
                              margin: const EdgeInsets.only(right: 20,left: 20),
                              child: Image.asset(
                                "${contenu![i].image}",
                                height: MediaQuery.of(context).size.width * .5,
                                fit: BoxFit.fill,
                                //height: MediaQuery.of(context).size.height,
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.all(20),
                                child:  Text(
                                  "${contenu![i].titre}",
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.justify,
                                )),
                            Container(
                                margin: EdgeInsets.all(20),
                                child: Text(
                                  "${contenu![i].description}",
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.justify,
                                )),
                          ]



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
}

