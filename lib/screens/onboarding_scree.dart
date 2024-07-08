import 'package:apex_sc/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding_screen1.dart';
import 'onboarding_screen2.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 1);
              });
            },
            children: const [
              OnboardingScreen1(),
              OnboardingScreen2(),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            right: 16,
            child: Visibility(
              visible: !onLastPage,
              child: GestureDetector(
                onTap: () {
                  _controller.jumpToPage(1);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 730,
            bottom: MediaQuery.of(context).size.height * 0.0,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (onLastPage)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        onLastPage;
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 130,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: SmoothPageIndicator(
                controller: _controller,
                count: 2,
                effect: const ExpandingDotsEffect(
                  dotHeight: 12,
                  dotWidth: 18,
                  dotColor: Colors.black38,
                  activeDotColor: Colors.blue,
                  spacing: 6,
                  expansionFactor: 2.5,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}

void onLastPage(context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool("ON_BOARDING", false);
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const SignUp()),
  );
}
