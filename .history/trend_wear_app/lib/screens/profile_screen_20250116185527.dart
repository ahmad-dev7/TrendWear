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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          "Hello".text.makeCentered(),
          const HeightBox(20),
          CupertinoButton.filled(
            minSize: 20,
            padding: const EdgeInsets.all(12),
            child: const Icon(CupertinoIcons.square_arrow_left),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
