import 'package:apex_sc/screens/otp_screen.dart';
import 'package:apex_sc/utils/color_utils.dart';
import 'package:apex_sc/widgets/button.dart';
import 'package:flutter/material.dart';

class VerifyYourIdentity extends StatefulWidget {
  const VerifyYourIdentity({super.key});

  @override
  State<VerifyYourIdentity> createState() => _VerifyYourIdentityState();
}

class _VerifyYourIdentityState extends State<VerifyYourIdentity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/icons/identity_icon.png'),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 0, top: 0, left: 10),
                    child: Text(
                      'Verify Your Identity',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  RichText(
                    text: const TextSpan(
                      text: '\n Where would you like',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ), // Default text style
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Smartpay ',
                          style: TextStyle(
                            color: blueHighlightedTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ), // Styled text
                        ),
                        TextSpan(
                          text: 'to send your \n security code?',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ), // Styled text
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Container(
                width: 360,
                height: 80,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white30,
                ),
                child: Stack(
                  children: [
                    Positioned(
                        top: 30,
                        left: 10,
                        child: Image.asset('assets/icons/tick_email.png')),
                    const Positioned(
                      right: 250,
                      top: 20,
                      child: Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    const Positioned(
                      right: 160,
                      top: 50,
                      child: Text(
                        'A*******@gmail.com',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const Positioned(
                      right: 20,
                      bottom: 20,
                      child: Icon(Icons.email_outlined),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Button(
                  buttonWidth: 327,
                  text: 'Continue',
                  navigatorDestination: OtpScreen(),
                  color: buttonActiveColor),
            ),
          ),
        ],
      ),
    );
  }
}
