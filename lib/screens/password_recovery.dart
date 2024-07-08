import 'package:apex_sc/screens/otp_screen.dart';
import 'package:apex_sc/utils/color_utils.dart';
import 'package:apex_sc/widgets/button.dart';
import 'package:flutter/material.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({super.key});

  @override
  State<PasswordRecovery> createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  final TextEditingController passRecvTextEditingController =
      TextEditingController();

  bool isTextFieldEmpty = true;

  @override
  void initState() {
    super.initState();
    passRecvTextEditingController.addListener(() {
      setState(() {
        isTextFieldEmpty = passRecvTextEditingController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    passRecvTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/icons/lock_icon.png'),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 0, top: 0, left: 10),
                      child: Text(
                        'Password Recovery',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 0, top: 0),
                      child: Text(
                          ' \n Enter your registered email to receive\n password instructions',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          )),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.transparent,
                    width: 390,
                    height: 80,
                    child: TextField(
                      controller: passRecvTextEditingController,
                      enabled: true,
                      textCapitalization: TextCapitalization.words,
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFF9FAFB),
                        enabled: true,
                        isDense: true,
                        label: const Text(
                          "Email",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        labelStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10.5),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Center(
                  child: Button(
                      buttonWidth: 327,
                      text: 'Send Me email',
                      navigatorDestination: const OtpScreen(),
                      color: isTextFieldEmpty
                          ? buttonInactiveColor
                          : buttonActiveColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
