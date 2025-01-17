import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? name = kSharedPreferences.getString("name");
  String? email = kSharedPreferences.getString("email");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: kScreenMargin),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeightBox(kScreenMargin),
                "Categories".text.bold.size(35).textStyle(GoogleFonts.lato()).make(),
                HeightBox(kScreenMargin * 0.5),
                ChoiceChip.elevated(label: "All".text.make(), selected: true, avatar: VxBox().make())
              ],
            ),
          ),
        ),
      ),
    );
  }
}