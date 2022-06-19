import 'dart:async';
import 'package:flutter/material.dart';
import 'landing_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    splashMulai();
  }

  splashMulai() {
    var durasi = const Duration(seconds: 3);
    return Timer(durasi, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return LandingPage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "images/logo1.png",
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
        ),
      ),
    );
  }
}
