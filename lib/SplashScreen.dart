import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vital_aid_on_flutter/MyHomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const MyHomePage()
            )
            ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset(
                'Assets/Animation/animation1.json', // Replace with the path to your Lottie JSON file
                fit: BoxFit.cover,
                width: 400, // Adjust the width and height as needed
                height: 400,// S
                repeat: false // et to true if you want the animation to loop
              ),
            ),
            const Center(
              child: Text(
              'Welcome to Vital-Aid',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
            )
          ],
        ),
      ),
    );
  }
}