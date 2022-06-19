import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projek_mobile_c1/audio/favoritePage.dart';
import 'package:projek_mobile_c1/pages/splashscreen_page.dart';
import 'package:projek_mobile_c1/screens/profile_page.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';
import 'services/auth_service.dart';
import 'wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Auth Example',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreenPage(),
          '/wrapper': (context) => Wrapper(),
          '/favorite_screen': (context) => FavoritePage(),
          '/profile_screen': (context) => ProfilePage(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
        },
      ),
    );
  }
}
