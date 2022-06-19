import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../audio/homePage.dart';
import '../themes.dart';
import 'login_page.dart';

class RegistrationPage extends StatefulWidget {
  final VoidCallback? showLoginPage;
  const RegistrationPage({Key? key, this.showLoginPage}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  Future signUp() async {
    try {
      if (passwordConfirmed()) {
        final _user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailController.text.trim(),
                password: _passwordController.text.trim());

        addUserDetails(
            _usernameController.text.trim(), _emailController.text.trim());

        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: successColor,
            content: Text('Your account has successfully registered'),
          ),
        );
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: alertColor,
            content: Text('Your password and confirm password is incorrect'),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: alertColor,
            content: Text('The email has already been registered'),
          ),
        );
      }
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: alertColor,
            content: Text('Your password is to weak'),
          ),
        );
      }
    }
  }

  Future addUserDetails(String username, String email) async {
    await FirebaseFirestore.instance.collection("users").add({
      'username': username,
      'email': email,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create an account",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[500],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  InputAkun(
                    label: "Username",
                    hint: 'Enter Your Username',
                    textFieldController: _usernameController,
                  ),
                  InputAkun(
                    label: "Email",
                    hint: 'Enter Your Email',
                    textFieldController: _emailController,
                  ),
                  InputAkun(
                      label: "Password",
                      hint: 'Enter Your Password',
                      textFieldController: _passwordController,
                      obscureText: true),
                  InputAkun(
                      label: "Confirm Password",
                      hint: 'Confirm Your Password',
                      textFieldController: _confirmPasswordController,
                      obscureText: true)
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: signUp,
                  color: Colors.orange,
                  elevation: 0,
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Widget inputAkun({label, obscureText = false}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         label,
//         style: TextStyle(
//           fontSize: 15,
//           fontWeight: FontWeight.w400,
//           color: Colors.black87,
//         ),
//       ),
//       SizedBox(
//         height: 5,
//       ),
//       TextField(
//         obscureText: obscureText,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey),
//           ),
//           border: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey),
//           ),
//         ),
//       ),
//       SizedBox(
//         height: 10,
//       )
//     ],
//   );
// }
