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
        children: [
          "Hello".text.makeCentered(),
          CupertinoButton.filled(
            child: const Icon(CupertinoIcons.zoom_out),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
