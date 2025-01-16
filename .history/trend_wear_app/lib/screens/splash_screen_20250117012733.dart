import 'package:animate_do/animate_do.dart';
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

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late bool isAuthenticated;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    checkUserToken();
  }

  void checkUserToken() {
    String? token = kSharedPreferences.getString("jwtToken");
    if (token != null && !JwtDecoder.isExpired(token)) {
      isAuthenticated = true;
    }
  }

  void navigateUser() {
    isAuthenticated
        ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const NavigationScreen()))
        : Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginSignupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animations/shopping_trolly.json',
            controller: _controller,
            onLoaded: (composition) {
              _controller.duration = composition.duration;
              _controller.forward();
              Future.delayed(composition.duration * 0.7).then((value) => navigateUser());
            },
          ),
          SlideInLeft(delay: Durations.short3, child: "Trend Wear".text.makeCentered()),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
