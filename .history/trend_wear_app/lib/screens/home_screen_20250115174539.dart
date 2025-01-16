import 'package:flutter/material.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: "Hello".text.makeCentered().box.height(1500).make(),
      ),
      bottomNavigationBar: SalomonBottomBar(
        items: List.generate(
          kBottomNavigationData.length,
          (index) => SalomonBottomBarItem(
            icon: Icon(kBottomNavigationData[index]!.iconData, color: kLightAccentColor),
            title: kBottomNavigationData[index]!.label.text.makeCentered(),
          ),
        ),
      ),
    );
  }
}
