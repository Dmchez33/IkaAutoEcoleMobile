import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Model/Panneaux.dart';
import '../../Provider/AutoecoleDataProvider.dart';
import '../../Service/PanneauxService.dart';
import 'package:just_audio/just_audio.dart';

class LiteContenuPanneaux extends StatefulWidget {
  final String? nomTypePanneaux;

  LiteContenuPanneaux({Key? key, required this.nomTypePanneaux})
      : super(key: key);

  @override
  State<LiteContenuPanneaux> createState() => _LiteContenuPanneauxState();
}

class _LiteContenuPanneauxState extends State<LiteContenuPanneaux> {
  //LES ELEMENTS DU COURS
  PanneauxService panneauxService = PanneauxService();
  List<PanneauDeConduite>? panneaux;

  //VARIABLE UTILSER POUR ÖUVOIR JOUER L'AUDIO
  static const url = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3';

  late AudioPlayer _audioPlayer;


  @override
  void initState() {
    super.initState();
    getAllPanneauxByType();
    _init();

  }

  void _init() async{
    _audioPlayer = AudioPlayer();
    await _audioPlayer.setUrl(url);
}
  void play() {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void dispose() {
    _audioPlayer.dispose();
  }

  getAllPanneauxByType() async {
    panneaux =
        await panneauxService.getAllPanneauxByType(widget.nomTypePanneaux);
    Provider.of<AutoecoleDataProvider>(context, listen: false)
        .panneauDeConduite = panneaux!;
    setState(() {});
  }


  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (panneaux == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Detail panneaux'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color(0xFF1A237E),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Detail panneaux'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color(0xFF1A237E),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            BannerCarousel(
              animation: true,
              viewportFraction: 0.8,
              showIndicator: true,
              spaceBetween: 1.0,
              customizedBanners: [
                for (int i = 0; i < panneaux!.length; i++) ...[
                  GestureDetector(
                    onTap: () {
                      //await flutterTts.speak("${panneaux![i].vocal}"); // Lire le champ vocal
                      setState(() {
                        _selectedIndex = i;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.red),
                        color: Colors.white,
                        image: DecorationImage(
                          image: NetworkImage("${panneaux![i].image}"),
                          //fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          //height: 20,
                          //color: Colors.white,
                          child: Text(
                            "${panneaux![i].nom}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: [
                  for (int i = 0; i < panneaux!.length; i++) ...[
                    Visibility(
                      visible: _selectedIndex == i,
                      child: Column(
                        children: [
                          Text(
                            "${panneaux![i].nom}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Image.network(
                            "${panneaux![i].image}",
                            //height: 150,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${panneaux![i].description}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      );return Scaffold(
        appBar: AppBar(
          title: const Text('Cours'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color(0xFF1A237E),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            BannerCarousel(
              animation: true,
              viewportFraction: 0.8,
              showIndicator: true,
              spaceBetween: 1.0,
              customizedBanners: [
                for (int i = 0; i < panneaux!.length; i++) ...[
                  GestureDetector(
                    onTap: () {
                      //await flutterTts.speak("${panneaux![i].vocal}"); // Lire le champ vocal
                      setState(() {
                        _selectedIndex = i;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.red),
                        color: Colors.white,
                        image: DecorationImage(
                          image: NetworkImage("${panneaux![i].image}"),
                          //fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          //height: 20,
                          //color: Colors.white,
                          child: Text(
                            "${panneaux![i].nom}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: [
                  for (int i = 0; i < panneaux!.length; i++) ...[
                    Visibility(
                      visible: _selectedIndex == i,
                      child: Column(
                        children: [
                          Text(
                            "${panneaux![i].nom}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Image.network(
                            "${panneaux![i].image}",
                            //height: 150,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${panneaux![i].description}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}

