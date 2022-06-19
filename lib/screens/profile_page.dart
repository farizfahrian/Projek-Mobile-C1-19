import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:projek_mobile_c1/models/navbar.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // ignore: unused_element
  Widget _textField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: double.infinity,
            height: 40,
            margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 231, 230, 228),
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 0.8,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Username',
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                Icon(Icons.email),
              ],
            )),
        Container(
            width: double.infinity,
            height: 40,
            margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 231, 230, 228),
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 0.8,
                    offset: Offset(2, 2),
                  ),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Email@email.com',
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                Icon(Icons.email),
              ],
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController usernameController = TextEditingController();

    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(),
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: fromCssColor("#f6e8df"),
          title: Text(
            'Profile',
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0),
      body: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.only(top: 250, left: 20, right: 20),
          child: SingleChildScrollView(child: _textField()),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          decoration: BoxDecoration(
              color: fromCssColor("#feae96"),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 0.8, offset: Offset(9, 9))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 2,
              ),
              Text(
                "${authService.getUsername().toString()}",
                style: TextStyle(color: Colors.grey[800], fontSize: 30),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: authService.getUsername(),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  authService.updateUsername(usernameController.text);
                },
                child: Text(
                  'Update Username',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: authService.getEmail(),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  authService.updateEmail(emailController.text);
                },
                child: Text(
                  'Update Email',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Center(
                child: ElevatedButton(
                  child: Text('Logout'),
                  onPressed: () async {
                    await authService.signOut();
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  authService.deleteAccount();
                },
                child: Text(
                  'Delete Account',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
