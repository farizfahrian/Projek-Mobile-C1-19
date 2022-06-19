import 'package:flutter/material.dart';
import 'package:projek_mobile_c1/audio/homePage.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';
import 'screens/login_screen.dart';
import 'services/auth_service.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null ? LoginScreen() : HomePage();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
