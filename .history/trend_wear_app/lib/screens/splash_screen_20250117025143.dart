import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:lottie/lottie.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:trend_wear_app/screens/login_signup_screen.dart';
import 'package:trend_wear_app/screens/navigation_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isAuthenticated = false;
  bool isTokenNull = true;

  @override
  void initState() {
    super.initState();
    checkUserToken();
  }

  void checkUserToken() {
    String? token = kSharedPreferences.getString("jwtToken");
    isTokenNull = token == null || token.isEmpty;

    if (!isTokenNull && !JwtDecoder.isExpired(token!)) {
      isAuthenticated = true;
    }
  }

  void navigateUser() {
    if (isAuthenticated) {
      // Navigate to Navigation Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const NavigationScreen()),
      );
    } else {
      if (!isTokenNull) {
        // Token exists but expired - Show dialog
        showDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
            title: const Text("Session Expired"),
            content: const Text("Your session has expired. Please login again."),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginSignupScreen()),
                  );
                },
                textStyle: TextStyle(color: kLightAccentColor),
                child: const Text("Login"),
              ),
            ],
          ),
        );
      } else {
        // Token is null, navigate directly to login screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginSignupScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animations/shopping_trolly.json',
            repeat: true,
            onLoaded: (_) => Future.delayed(_.duration * 0.7).then((value) => navigateUser()),
          ),
          SlideInLeft(
            delay: const Duration(milliseconds: 300), // Adjust delay for animation
            child: "Trend Wear".text.bold.xl.makeCentered(),
          ),
        ],
      ),
    );
  }
}
