import 'package:apex_sc/screens/sign_up.dart';
import 'package:apex_sc/utils/color_utils.dart';
import 'package:apex_sc/widgets/button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                    alignment: Alignment(0, 2.9),
                    child: Image.asset(
                      "assets/images/card_phone.jpg",
                      height: 800,
                      width: 800,
                    )),
                Container(
                  alignment: Alignment(0, -0.3),
                  child: Image.asset(
                    "assets/images/actual_stack1.png",
                    height: 400,
                    width: 400,
                    repeat: ImageRepeat.noRepeat,
                  ),
                ),
                Container(
                  alignment: Alignment(0, 0.4),
                  child: const Text(
                    "Finance app the safest \n     and most trusted",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 34),
                  ),
                ),
                Container(
                  alignment: Alignment(0, 0.6),
                  child: Text(
                    "Your finance work starts here. We're here to help \n       "
                    "you "
                    "track and deal with speeding up your\n "
                    "                               "
                    "transactions.",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          const Button(
              text: 'Get Started',
              navigatorDestination: SignUp(),
              color: buttonActiveColor),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
