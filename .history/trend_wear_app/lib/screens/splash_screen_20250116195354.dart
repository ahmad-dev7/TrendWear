import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    manageLottieAnimationStatus();
  }

  void manageLottieAnimationStatus() {
    // Add listeners to detect when the animation starts and completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        print("Animation started");
      } else if (status == AnimationStatus.completed) {
        print("Animation completed");
        // Reset or loop the animation if needed
        _controller.reset(); // Resetting the animation
        // _controller.repeat(); // Uncomment to loop the animation
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lottie Animation"),
      ),
      body: Center(
        child: Lottie.asset(
          'assets/animations/optimized.json',
          controller: _controller,
          onLoaded: (composition) {
            // Set the animation duration to match the Lottie animation duration
            _controller.duration = composition.duration;
            // Start the animation
            _controller.forward();
          },
        ),
      ),
    );
  }
}
