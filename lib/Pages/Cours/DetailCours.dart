import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DetailCoursPage extends StatefulWidget {
  const DetailCoursPage({Key? key}) : super(key: key);

  @override
  _DetailCoursPageState createState() => _DetailCoursPageState();
}

class _DetailCoursPageState extends State<DetailCoursPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //DEBUT DE PLACE DE LA VIDEO
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the video.
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    // Use the VideoPlayer widget to display the video.
                    child: VideoPlayer(_controller),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            /*FloatingActionButton(
              onPressed: () {
                // Wrap the play or pause in a call to `setState`. This ensures the
                // correct icon is shown.
                setState(() {
                  // If the video is playing, pause it.
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    // If the video is paused, play it.
                    _controller.play();
                  }
                });
              },
              // Display the correct icon depending on the state of the player.
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),*/
            //FIN DE LA PLACE DE LA VIDEO

            //DEBUT DE LA PLACE DE L'IMAGE
            ListTile(
              leading: SizedBox(
                height: 1000,
                child: Image.asset(
                  "assets/images/imagecours/notion_theorie.png",
                  fit: BoxFit.cover,
                ),
              ),
              title:  const Text(
                    "L’arrêt est l’immobilisation momentanée d’un véhicule pour permettre :",
                    textAlign: TextAlign.justify,
                 )
            ),
            Container(
              child: const Text(
                "La montée ou descente de passagers, Le chargement ou le dechargement d’objets. Le conducteur doit rester près de la véhicule pour être en mesure de le deplacer en cas de besoin.",
                textAlign: TextAlign.justify,
              ),
            ),


            //FIN DE LA PLACE DE L'IMAGE

            //DEBUT DE LA PLACE DU CONTENU
            //FIN DE LA PLACE DU CONTENU
          ],
        ),
      ),
    );
  }
}
