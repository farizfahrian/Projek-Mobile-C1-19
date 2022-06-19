import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:projek_mobile_c1/audio/favoritePage.dart';
import 'package:projek_mobile_c1/audio/homePage.dart';
import 'package:projek_mobile_c1/screens/profile_page.dart';
import 'package:projek_mobile_c1/themes.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20.0 * 2,
        right: 20.0 * 2,
        bottom: 20.0,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: fromCssColor("#feae96"),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: backgroundColor,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return HomePage();
                }),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            color: Color.fromARGB(255, 255, 5, 5),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return FavoritePage();
                }),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return ProfilePage();
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
