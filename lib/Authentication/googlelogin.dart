import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insideflyingconcept/Dashboard/dashboard.dart';
import 'package:insideflyingconcept/splashscreen.dart';



class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();

   static const String routeName = "googlelogin";
}

class _GoogleLoginState extends State<GoogleLogin> {
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return const Dashboard();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Something Went Wrong"),
              );
            } else {
              return const SplashScreen();
            }
          }),
    );
  }
}
