import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:marquee/marquee.dart';
import 'package:projek_mobile_c1/models/navbar.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';
import '../widgets/shadow_text.dart';
import 'database.dart';
import 'musicPlayer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(),
      backgroundColor: fromCssColor("#f6e8df"),
      appBar: AppBar(
        backgroundColor: fromCssColor("#feae96"),
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8, left: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Hello,",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  "${authService.getUsername().toString()}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "Popular Songs",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: fromCssColor("#013237")),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 0, top: 10, bottom: 20),
                  height: 300,
                  child: TrackWidget(),
                ),
                CircleTrackWidget(
                  song: newRelease,
                  title: "New Release",
                ),
                CircleTrackWidget(
                  song: mostPopular,
                  title: "Your Favorite",
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TrackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mostPopular.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        final Song popularSong = mostPopular[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MusicPlayer(song: popularSong);
            }));
          },
          child: Container(
            margin: EdgeInsets.all(10),
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: popularSong.color,
                      blurRadius: 1,
                      spreadRadius: 0.3)
                ],
                image: DecorationImage(
                  image: NetworkImage(popularSong.imageUrl.toString()),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.darken),
                )),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mostPopular[index].name,
                    style: TextStyle(
                      shadows: outlinedText(
                        strokeWidth: 0.1,
                        precision: 10,
                        strokeColor: Color(0x99CECECE),
                      ),
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(popularSong.singer,
                      style: TextStyle(
                          color: fromCssColor("#ffffff"),
                          fontWeight: FontWeight.normal,
                          fontSize: 12)),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CircleTrackWidget extends StatelessWidget {
  final String title;
  final List<Song> song;

  CircleTrackWidget({
    required this.title,
    required this.song,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: fromCssColor("#fe979c")),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 20),
          ),
          Container(
            height: 120,
            child: ListView.builder(
              itemCount: song.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final Song circleTrackSong = song[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MusicPlayer(song: circleTrackSong);
                    }));
                  },
                  child: Container(
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(circleTrackSong.imageUrl.toString()),
                          radius: 40,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        showMarqueeText(circleTrackSong.name, "#fe979c"),
                        showMarqueeText(circleTrackSong.singer, "#013237"),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

Widget showMarqueeText(String text, String color) {
  return text.length > 18
      ? withMarqueeText(text, color)
      : noMarqueeText(text, color);
}

Widget noMarqueeText(String text, String color) {
  return Text(
    text,
    style: TextStyle(color: fromCssColor(color)),
  );
}

Widget withMarqueeText(String text, String color) {
  return Expanded(
    child: Marquee(
      text: text,
      scrollAxis: Axis.horizontal,
      startPadding: 0,
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 20.0,
      velocity: 50.0, //speed
      pauseAfterRound: Duration(seconds: 1),
      style: TextStyle(
        color: fromCssColor(color),
      ),
    ),
  );
}
