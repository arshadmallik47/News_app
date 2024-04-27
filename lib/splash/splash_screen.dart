// ignore_for_file: avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screens/home_screen.dart';

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
      const Duration(seconds: 5),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    //final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/splash_pic.jpg',
              fit: BoxFit.cover,
              // width: width * .9,
              height: height * .5,
            ),
            const SizedBox(height: 30),
            Text(
              'TOP HEADLINES',
              style: GoogleFonts.anton(
                letterSpacing: .6,
                color: Colors.grey.shade700,
                fontSize: 22,
              ),
            ),
            // SizedBox(height: height * 0.84),
            const SizedBox(
              height: 30,
            ),
            const SpinKitChasingDots(
              color: Colors.purple,
              size: 40,
            ),
          ],
        ),
      ),
    );
  }
}
