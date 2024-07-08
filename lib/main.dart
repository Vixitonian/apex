import 'package:apex_sc/providers/auth_provider.dart';
import 'package:apex_sc/screens/home_screen.dart';
import 'package:apex_sc/screens/onboarding_scree.dart';
import 'package:apex_sc/screens/otp_screen.dart';
import 'package:apex_sc/screens/password_recovery.dart';
import 'package:apex_sc/screens/sign_in.dart';
import 'package:apex_sc/screens/sign_up.dart';
import 'package:apex_sc/screens/splash_screen.dart';
import 'package:apex_sc/screens/verify_your_identity.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      child: MaterialApp(
        routes: {
          //NB: screen names below are exactly as stated in the figma file.

          // Splash Screen
          "SplashScreen": (context) => const SplashScreen(),
          // Onboarding Screens
          "Onboarding": (context) => const OnboardingScreen(),
          // //Sign in Screen
          "Signin": (context) => const SignIn(),
          // password recovery Screens
          "Password Recovery": (context) => const PasswordRecovery(),
          //   "Verifiy Identity": (context)=> const VerfifyIdentity(),
          //   "Reset Password": (context)=> const ResetPassword(),
          // // Sign Up Screen
          "Signup": (context) => const SignUp(),
          // OTP Authentication Screen
          "Otp": (context) => const OtpScreen(),
          // Id Screen (Identification Screen)
          "Verify Id": (context) => const VerifyYourIdentity(),
          //  // Create Pin Screen
          //   "Create pin": (context)=> const SigninScreen(),
          "Home": (context) => const HomeScreen(),
        },
        home: OnboardingScreen(),
        builder: OneContext().builder,
        navigatorKey: OneContext().key,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
