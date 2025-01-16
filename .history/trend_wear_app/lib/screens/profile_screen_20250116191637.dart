import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:trend_wear_app/screens/login_signup_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    void logoutDialog() {
      // It will be executed once user selects logout from alert dialog
      void logout() {
        kSharedPreferences.clear().whenComplete(
              () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginSignupScreen()),
              ),
            );
      }

      showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: "Are you sure!".text.make(),
          content: "You want to logout".text.make(),
          actions: [
            CupertinoDialogAction(isDefaultAction: true, child: "Cancel".text.make()),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: logout,
              child: "Logout".text.make(),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          "Hello".text.makeCentered(),
          const HeightBox(20),
          CupertinoButton(
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
