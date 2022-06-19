import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:provider/provider.dart';

import '../models/navbar.dart';
import '../services/auth_service.dart';
import 'favorite_database.dart';
import 'homePage.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
                CircleTrackWidget(
                  song: favoriteSong.toList(),
                  title: "Favorite List",
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
