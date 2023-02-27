import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ika_auto_ecole/Pages/Videos/video_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Compte/compte.dart';

/// Homepage
class YoutubePlayerDemoApp extends StatefulWidget {
  @override
  _YoutubePlayerDemoAppState createState() => _YoutubePlayerDemoAppState();
}

class _YoutubePlayerDemoAppState extends State<YoutubePlayerDemoApp> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  int _selectedTabIndex = 0;

  final List<String> _ids = [
    'E9vrcivm78o',
    'mm8IbUXXqGk',
    'umy0Jsejqmo',
    '5aRCzToYtfM',
    'dgdYfjp1glE',
    'G96Na1blpQs',
    '3x5U8BOOcxM',
    'f0-HEc_DaGw',
    '4VaQRWab-xA',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: _selectedTabIndex,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // cacher l'icône de retour
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  "Cours Enregistrer",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Tab(
                  child: Text(
                "Cours en Direct",
                style: TextStyle(fontSize: 18),
              )),
            ],
          ),
          backgroundColor: const Color(0xFF1A237E),
          centerTitle: true,
          title: const Text(
            'Cours Pratique AutoEcole',
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A237E)),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const compte()),
                );
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            YoutubePlayerBuilder(
              onExitFullScreen: () {
                // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
                SystemChrome.setPreferredOrientations(DeviceOrientation.values);
              },
              player: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blueAccent,
                topActions: <Widget>[
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      _controller.metadata.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 25.0,
                    ),
                    onPressed: () {
                      log('Settings Tapped!');
                    },
                  ),
                ],
                onReady: () {
                  _isPlayerReady = true;
                },
                onEnded: (data) {
                  _controller.load(
                      _ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
                  _showSnackBar('La prochaine vidéo a commencé!');
                },
              ),
              builder: (context, player) => Scaffold(
                body: ListView(
                  children: [
                    player,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.skip_previous),
                                onPressed: _isPlayerReady
                                    ? () => _controller.load(_ids[(_ids.indexOf(
                                                _controller.metadata.videoId) -
                                            1) %
                                        _ids.length])
                                    : null,
                              ),
                              IconButton(
                                icon: Icon(
                                  _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                ),
                                onPressed: _isPlayerReady
                                    ? () {
                                        _controller.value.isPlaying
                                            ? _controller.pause()
                                            : _controller.play();
                                        setState(() {});
                                      }
                                    : null,
                              ),
                              IconButton(
                                icon: Icon(_muted
                                    ? Icons.volume_off
                                    : Icons.volume_up),
                                onPressed: _isPlayerReady
                                    ? () {
                                        _muted
                                            ? _controller.unMute()
                                            : _controller.mute();
                                        setState(() {
                                          _muted = !_muted;
                                        });
                                      }
                                    : null,
                              ),
                              FullScreenButton(
                                controller: _controller,
                                color: Colors.blueAccent,
                              ),
                              IconButton(
                                icon: const Icon(Icons.skip_next),
                                onPressed: _isPlayerReady
                                    ? () => _controller.load(_ids[(_ids.indexOf(
                                                _controller.metadata.videoId) +
                                            1) %
                                        _ids.length])
                                    : null,
                              ),
                            ],
                          ),
                          //_space,
                          _text('Title', _videoMetaData.title),
                          _space,
                          Container(
                            height: 230,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: _ids.length,
                              itemBuilder: (context, index) => Container(
                                width: 260,
                                height: 120,
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://img.youtube.com/vi/${_ids[index]}/0.jpg"),
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    _controller.load(_ids[index]);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black.withOpacity(0.7),
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        _videoMetaData.title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(60),

              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 1)
              ),
               child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white70
                  ),
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.ondemand_video,size: 100, color: Color(0xFF6200EE),),
                      Text("cliquer ici pour être rediriger vers notre compte youtube et suivre nos formation en live")
                    ],
                  ),
               ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: const TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStateColor(PlayerState state) {
    switch (state) {
      case PlayerState.unknown:
        return Colors.grey[700]!;
      case PlayerState.unStarted:
        return Colors.pink;
      case PlayerState.ended:
        return Colors.red;
      case PlayerState.playing:
        return Colors.blueAccent;
      case PlayerState.paused:
        return Colors.orange;
      case PlayerState.buffering:
        return Colors.yellow;
      case PlayerState.cued:
        return Colors.blue[900]!;
      default:
        return Colors.blue;
    }
  }

  Widget get _space => const SizedBox(height: 10);

  Widget _loadCueButton(String action) {
    return Expanded(
      child: MaterialButton(
        color: Colors.blueAccent,
        onPressed: _isPlayerReady
            ? () {
                if (_idController.text.isNotEmpty) {
                  var id = YoutubePlayer.convertUrlToId(
                        _idController.text,
                      ) ??
                      '';
                  if (action == 'LOAD') _controller.load(id);
                  if (action == 'CUE') _controller.cue(id);
                  FocusScope.of(context).requestFocus(FocusNode());
                } else {
                  _showSnackBar('Source can\'t be empty!');
                }
              }
            : null,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            action,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}

//WIDGET PERMETTANT DE METTRE LA BORDURE SOUS FORME D'ARC
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
