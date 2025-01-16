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
      // It will be executed once the user selects logout from the alert dialog
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
          title: const Text("Are you sure!"),
          content: const Text("You want to logout"),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: "Cancel".text.make(),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss dialog
              },
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: "Logout".text.make(),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss dialog
                logout(); // Perform logout
              },
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
