import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:flutter/material.dart';

import '../widgets/shadow_text.dart';
import 'database.dart';
import 'favorite_database.dart';

class MusicPlayer extends StatefulWidget {
  final Song song;
  MusicPlayer({required this.song});

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  bool _isFavorite = false;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    setAudio();

    // listen to states of: play, pause, stop
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        _isPlaying = state == PlayerState.playing;
      });
    });

    // listen to duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    // listen to postion
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    // repeat song
    audioPlayer.setReleaseMode(ReleaseMode.loop);

    // load song from UrlSource
    String url = widget.song.songUrl;
    audioPlayer.setSource(UrlSource(url));
    await audioPlayer.play(UrlSource(url));

    // final player = AudioCache(prefix: 'images/');
    // final url = await player.load('RizkyFebian-Ragu.mp3');
    // audioPlayer.setSource(UrlSource(url.path));

    //load from local
    // final result = await FilePicker.platform.pickFiles();

    // if (result != null) {
    //   final file = File(result.files.single.path!);
    //   audioPlayer.setSourceUrl(file.path)
    // }
    // final file = File(path);
    // audioPlayer.setSourceAsset(file.path);
  }

  @override
  void dispose() {
    audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: "image",
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.song.imageUrl),
                    fit: BoxFit.cover)),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 50, left: 20, right: 20),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 14,
                  spreadRadius: 16,
                  color: fromCssColor("#f6e8df").withOpacity(0.2),
                )
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.1), BlendMode.difference),
                    child: Container(
                      height: 280,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: fromCssColor("#f6e8df").withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              width: 1.5,
                              color: Colors.white.withOpacity(0.2))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  widget.song.name,
                                  style: TextStyle(
                                      shadows: outlinedText(
                                        strokeWidth: 0.25,
                                        precision: 1,
                                        strokeColor: Color(
                                          0x998B8B8B,
                                        ),
                                      ),
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  child: favoriteIcon(),
                                  onTap: () {
                                    if (_isFavorite) {
                                      favoriteSong.remove(widget.song);
                                      _isFavorite = false;
                                    } else {
                                      favoriteSong.add(widget.song);
                                      _isFavorite = true;
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              widget.song.singer,
                              style: TextStyle(
                                  shadows: outlinedText(
                                    strokeWidth: 0.3,
                                    precision: 10,
                                    strokeColor: Color(0x99CECECE),
                                  ),
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 2),
                                  trackShape: RectangularSliderTrackShape(),
                                  trackHeight: 6),
                              child: Slider(
                                inactiveColor: Colors.white70,
                                activeColor: fromCssColor("#fe979c"),
                                min: 0,
                                max: duration.inSeconds.toDouble(),
                                value: position.inSeconds.toDouble(),
                                onChanged: (value) async {
                                  final position =
                                      Duration(seconds: value.toInt());
                                  await audioPlayer.seek(position);

                                  // Play audio when pause
                                  await audioPlayer.resume();
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  (position)
                                      .toString()
                                      .split('.')[0]
                                      .substring(2),
                                  style: TextStyle(
                                      shadows: outlinedText(
                                        strokeWidth: 0.4,
                                        precision: 10,
                                        strokeColor: Color(0x99CECECE),
                                      ),
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                Text(
                                  (duration - position)
                                      .toString()
                                      .split('.')[0]
                                      .substring(2),
                                  style: TextStyle(
                                      shadows: outlinedText(
                                        strokeWidth: 0.3,
                                        precision: 10,
                                        strokeColor: Color(0x99CECECE),
                                      ),
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                child: Icon(CupertinoIcons.gobackward_10,
                                    color: Colors.white, size: 30),
                                onTap: () async {
                                  if (position > Duration(seconds: 10)) {
                                    position -= Duration(seconds: 10);
                                    await audioPlayer.seek(position);
                                    await audioPlayer.resume();
                                  }
                                },
                              ),
                              CircleAvatar(
                                radius: 35,
                                child: InkWell(
                                  child: IconButton(
                                    icon: Icon(_isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow),
                                    iconSize: 50,
                                    onPressed: () async {
                                      if (_isPlaying) {
                                        await audioPlayer.pause();
                                      } else {
                                        await audioPlayer.resume();
                                      }
                                    },
                                  ),
                                ),
                              ),
                              GestureDetector(
                                child: Icon(CupertinoIcons.goforward_10,
                                    color: Colors.white, size: 30),
                                onTap: () async {
                                  if (duration - position >
                                      Duration(seconds: 10)) {
                                    position += Duration(seconds: 10);
                                    await audioPlayer.seek(position);
                                    await audioPlayer.resume();
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget favoriteIcon() {
    if (favoriteSong.contains(widget.song)) {
      return Icon(
        Icons.favorite_rounded,
        color: Colors.red,
        size: 20,
      );
    } else {
      return Icon(
        Icons.favorite_border_rounded,
        color: Colors.red,
        size: 20,
      );
    }
  }
}

// if (favoriteSong.contains(widget.song)) {
//       bool _isFavorite = true;
//     } else {
//       bool _isFavorite = true;
//     }
