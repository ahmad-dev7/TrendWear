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

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late bool isAuthenticated;
  late bool isTokenNull;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    checkUserToken();
  }

  void checkUserToken() {
    String? token = kSharedPreferences.getString("jwtToken");
    isTokenNull = token.isEmptyOrNull;
    if (!isTokenNull && !JwtDecoder.isExpired(token!)) isAuthenticated = true;
  }

  void navigateUser() {
    var goToNav = Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const NavigationScreen()));
    var goToLogin = Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginSignupScreen()));
    // Is authenticated means token is valid
    if (isAuthenticated) {
      goToNav;
    }
    // when token is not valid
    else {
      // if token is not null but is expired, take user for login through dialog
      if (!isTokenNull) {
        showDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
            title: const Text("Your session has expired"),
            content: const Text("Please login again"),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => goToLogin,
                child: const Text("Login"),
              ),
            ],
          ),
        );
      }
      // token is null, take user for login directly
      else {
        goToLogin;
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
