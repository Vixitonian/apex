import 'package:flutter/material.dart';

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          Container(
              alignment: Alignment(0,-0.1),
              child: Image.asset("assets/images/Mask phone.png")
          ),
          Container(
            alignment: Alignment(0,-0.1),
            child: Image.asset(
              "assets/images/actual stack 2.png",
              height: 870,
              filterQuality: FilterQuality.high,
              width: 750,
            ),
          ),
          Container(
            alignment: Alignment(0,0.4),
            child: Text(
              "The fastest transaction \n       process only here",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 34
              ),
            ),
          ),

          Container(
            alignment: Alignment(0,0.6),
            child: Text(
              "Get easy to pay all your bills with just a few \nsteps. Paying "
                  "your bills becomes fast and \n                            "
                  "   efficient.",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
