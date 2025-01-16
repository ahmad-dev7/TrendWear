import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:lottie/lottie.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:trend_wear_app/screens/login_signup_screen.dart';
import 'package:trend_wear_app/screens/navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    manageLottieAnimationStatus();
  }

  void manageLottieAnimationStatus() {
    _controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.forward) {
          String? token = kSharedPreferences.getString("jwtToken");
          //! [JwtDecoder.isExpired(token)] Returns true if the token is valid, false if it is expired.
          if (token != null && JwtDecoder.isExpired(token)) {
            isAuthenticated = true;
          }
        } else if (status == AnimationStatus.completed) {
          isAuthenticated
              ? Navigator.push(context, MaterialPageRoute(builder: (_) => const NavigationScreen()))
              : Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginSignupScreen()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/animations/splash_cart.json',
          controller: _controller,
          onLoaded: (composition) {
            _controller.duration = composition.duration;
            _controller.forward();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
