import 'dart:async';
import 'package:apex_sc/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, "Signin");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 0,
                ),
                Lottie.asset(
                  "assets/animations/apex_logo.json",
                  fit: BoxFit.cover,
                  repeat: false,
                ),
                Center(child: Image.asset("assets/icons/apex_logo.png")),
              ],
            ),
          ],
        ),
        backgroundColor: primaryBackgroundColor,
      ),
    );
  }
}
