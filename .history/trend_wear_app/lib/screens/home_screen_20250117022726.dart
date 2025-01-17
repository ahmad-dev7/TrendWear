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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeightBox(kScreenMargin),
                "Categories".text.bold.size(35).textStyle(GoogleFonts.lato()).make(),
                HeightBox(kScreenMargin * 0.5),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      categories.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: ChoiceChip.elevated(
                            label: categories[index].text.make(), selected: true, showCheckmark: false),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> categories = <String>[
  "All",
  "Jacket",
  "Jeans",
  "Shoes",
  "T-Shirts",
  "Shirts",
  "Watches",
  "Hats",
  "Sportswear",
  "Formal Wear",
  "Casual Wear",
];
