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

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _textController;
  late Animation<Offset> _textAnimation;

  bool isAuthenticated = false;
  bool isAnimationCompleted = false;

  @override
  void initState() {
    super.initState();

    // Main Lottie Animation Controller
    _controller = AnimationController(vsync: this);

    // Text Slide Animation Controller
    _textController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // Slide Animation for Text
    _textAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), // Start from left
      end: const Offset(0.0, 0.0), // Move to center
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeInOut));

    checkUserToken();
  }

  void checkUserToken() {
    String? token = kSharedPreferences.getString("jwtToken");
    if (token != null && JwtDecoder.isExpired(token)) {
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
    return FadeOut(
      animate: isAnimationCompleted,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie Animation
            Lottie.asset(
              'assets/animations/shopping_trolly.json',
              controller: _controller,
              onLoaded: (composition) {
                _controller.duration = composition.duration;
                _controller.forward();
                _textController.forward();
                // Start text animation 0.7 seconds into the Lottie animation
                Future.delayed(composition.duration * 0.3).then((value) {
                  setState(() => isAnimationCompleted = true);
                  navigateUser();
                });
              },
            ),

            // Slide Animation for "Trend Wear"
            SlideTransition(
              position: _textAnimation,
              child: AnimatedOpacity(
                opacity: isAnimationCompleted ? 0.0 : 1.0, // Fade out when completed
                duration: const Duration(milliseconds: 500),
                child: "Trend Wear".text.bold.size(24).makeCentered(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose();
    super.dispose();
  }
}
