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
  void logout() {
    showDialog(
      context: context,
      builder: (context) => VxBox(
        child: CupertinoAlertDialog(
          title: "Are you sure!".text.make(),
          content: "You want to logout".text.make(),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: "Cancel".text.make()),
            TextButton(onPressed: () => Navigator.pop(context), child: "Logout".text.make())
          ],
        ),
      ).height(200).width(400).make(),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: logout,
            child: const Icon(CupertinoIcons.square_arrow_left),
          ),
        ],
      ),
    );
  }
}
