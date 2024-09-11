import 'dart:async';
import 'package:aura/home_page.dart';
import 'package:aura/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Homepage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Splash.jpg'),
            fit:
                BoxFit.cover, // Adjust the image to cover the entire background
          ),
        ),
        child: const Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Aura',
                    style: TextStyle(
                      fontFamily: 'BasierSquare-Regular',
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'A Web-3 based Chatbot',
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      color: Pallete.firstSuggestionBoxColor,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),

                ],
              ),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Center(
                child: SpinKitFadingCube(
                  color: Pallete.firstSuggestionBoxColor,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
