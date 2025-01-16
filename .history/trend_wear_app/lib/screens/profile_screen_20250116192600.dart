import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text("Are you sure!"),
          content: const Text("You want to logout"),
          actions: [
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text("Logout"),
              onPressed: () {},
            ),
            const CupertinoDialogAction(
              child: Text("Cancel"),
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