import 'package:flutter/cupertino.dart';
import 'package:trend_wear_app/screens/login_signup_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      child: LoginSignupScreen(),
    );
  }
}
