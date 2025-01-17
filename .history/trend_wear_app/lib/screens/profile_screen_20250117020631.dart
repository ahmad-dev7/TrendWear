import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:trend_wear_app/cubit/bottom_navigation_cubit.dart';
import 'package:trend_wear_app/screens/login_signup_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? name = kSharedPreferences.getString("name");
  String? email = kSharedPreferences.getString("email");
  void logoutDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CupertinoAlertDialog(
        insetAnimationDuration: Durations.medium1,
        insetAnimationCurve: Curves.decelerate,
        title: const Text("Are you sure!"),
        content: const Text("You want to logout"),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const Text("Logout"),
            onPressed: () {
              kSharedPreferences.clear().then((_) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginSignupScreen()));
                context.read<BottomNavigationCubit>().updateIndex(1);
              });
            },
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(context),
            textStyle: const TextStyle(color: Colors.black87, fontSize: 16),
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          "Hello $name".text.makeCentered(),
          const HeightBox(20),
          CupertinoButton(
            minSize: 20,
            color: Colors.red,
            padding: const EdgeInsets.all(12),
            onPressed: logoutDialog,
            child: const Icon(CupertinoIcons.square_arrow_left),
          ),
        ],
      ),
    );
  }
}
