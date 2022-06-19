import 'package:flutter/material.dart';

import '../themes.dart';
import 'login_page.dart';
import 'registration_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: defaultMargin,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Text(
              "Welcome to Dart Music App",
              textAlign: TextAlign.center,
              style: primaryTextStyle.copyWith(
                  fontSize: 35, fontWeight: bold, color: primaryColor),
            ),
          ),
          Center(
            child: Container(
              width: 155,
              height: 366,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/logo2.png"),
              )),
            ),
          ),
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 8),
            child: Text(
              "Relax in Music",
              textAlign: TextAlign.center,
              style: secondaryTextStyle.copyWith(
                fontSize: 20,
                color: primaryTextColor,
                fontWeight: bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Text(
              "Listen to most relaxing sounds according to your desiers of the moment",
              textAlign: TextAlign.center,
              style: secondaryTextStyle.copyWith(
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LandingPage2()));
                },
                child: Text(
                  "Next",
                  style: primaryTextStyle.copyWith(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LandingPage2 extends StatelessWidget {
  const LandingPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: defaultMargin,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Text(
              "Welcome to Dart Music App",
              textAlign: TextAlign.center,
              style: primaryTextStyle.copyWith(
                  fontSize: 35, fontWeight: bold, color: primaryColor),
            ),
          ),
          Center(
            child: Container(
              width: 155,
              height: 366,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/logo3.png"),
              )),
            ),
          ),
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 8),
            child: Text(
              "Take the time",
              textAlign: TextAlign.center,
              style: secondaryTextStyle.copyWith(
                fontSize: 20,
                color: primaryTextColor,
                fontWeight: bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Text(
              "Take the time to discover the most relaxing sounds according to the musical genre your enjoy",
              textAlign: TextAlign.center,
              style: secondaryTextStyle.copyWith(
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LandingPage3()));
              }),
              child: Text(
                "Next",
                style: primaryTextStyle.copyWith(
                  color: primaryColor,
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LandingPage3 extends StatelessWidget {
  const LandingPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: defaultMargin,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Text(
            "Welcome to Dart Music App",
            textAlign: TextAlign.center,
            style: primaryTextStyle.copyWith(
                fontSize: 35, fontWeight: bold, color: primaryColor),
          ),
        ),
        Center(
          child: Container(
            width: 155,
            height: 366,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/logo1.png"),
            )),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          child: Text(
            "High Quality Music",
            textAlign: TextAlign.center,
            style: secondaryTextStyle.copyWith(
              fontSize: 20,
              color: primaryTextColor,
              fontWeight: bold,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Listening to our high quality music will boost your day daily mood",
            textAlign: TextAlign.center,
            style: secondaryTextStyle.copyWith(
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        ElevatedButton(
          child: Text("Get Started"),
          onPressed: () {
            Navigator.pushNamed(context, '/wrapper');
          },
          style: ElevatedButton.styleFrom(
            primary: primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 16),
          ),
        ),
      ]),
    );
  }
}

class PageLoginRegis extends StatelessWidget {
  const PageLoginRegis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding:
              EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Selamat Datang",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: defaultMargin,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Dengarkan kumpulan lagu gratis di Dart Music",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(),
              ),
              Column(
                children: [
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationPage()));
                        },
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
