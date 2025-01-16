import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => FavoriteScreenState();
}

class FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: "Favorite Screen".text.makeCentered(),
    );
  }
}
