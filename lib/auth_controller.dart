import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/home_page.dart';
import 'package:tutorial/login_page.dart';

class AuthController extends StatelessWidget {
  const AuthController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
          body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, data) {
          if (data.connectionState == ConnectionState.active) {
            final bool isLoggedIn = data.hasData;
            return isLoggedIn ? HomePage() : LoginPage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
