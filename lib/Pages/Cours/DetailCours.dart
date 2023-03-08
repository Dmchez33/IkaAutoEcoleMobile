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
  contenuCours? contenu;
/*  loadAudioPlayer() {
    controlleraudio = VideoPlayerController.asset('assets/audio/Arrêtstationnementdefinition.mp3');
    controlleraudio.addListener(() {
      setState(() {});
    });
    controlleraudio.initialize().then((value) {
      setState(() {});
    });
  }*/

  getAllCours() async {
    print(widget.idContenu);
    contenu = await coursService.getAllContenuById(widget.idContenu);
    Provider
        .of<AutoecoleDataProvider>(context, listen: false)
        .contenuById = contenu!;
    setState(() {
      //loadAudioPlayer('assets/audio/Arrêtstationnementdefinition.mp3');
    });
  }
  @override
  void initState() {
    /*loadVideoPlayer();
    loadAudioPlayer();*/
    super.initState();
    //loadAudioPlayer();
    //loadAudioPlayer('assets/audio/mentdefinition.mp3');
    getAllCours();
    playAudioWelCome = false;
    loadAudioPlayer('assets/audio/mentdefinition.mp3');
  }




  loadAudioPlayer(String lien) {
    controlleraudio = VideoPlayerController.asset(
        lien);
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
                        margin: EdgeInsets.all(10),
                        child: InteractiveViewer(
                          child:  Image.network(
                            "${contenu!.description}",
                            fit: BoxFit.fitWidth,

                          ),

                          boundaryMargin: EdgeInsets.all(20.0),
                          minScale: 0.1,
                          maxScale: 5.0,
                          panEnabled: false,
                          scaleEnabled: false,
                        ),
                      ),

                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF1A237E),
          onPressed: () async{
            //loadAudioPlayer('assets/audio/cours/${contenu!.vocal}');
            /*if (controlleraudio.value.isPlaying) {
              controlleraudio.pause();
            } else {
              controlleraudio.play();
            }*/
            if (controlleraudio.value.isPlaying) {
              controlleraudio.pause();
            } else {
              controlleraudio.play();
            }
            setState(() {


            });

          },
          child: Icon(controlleraudio.value.isPlaying
              ? Icons.pause
              : Icons.play_arrow),
        ),
      );
    }
  }
}

