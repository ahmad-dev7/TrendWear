import 'dart:async';

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
  int selectedChip = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeightBox(kScreenMargin),
              "Categories".text.bold.size(35).textStyle(GoogleFonts.lato()).make().pad.px20.make(),
              HeightBox(kScreenMargin * 0.5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    categories.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(left: kScreenMargin, right: index == categories.length - 1 ? 20 : 5),
                      child: ChoiceChip.elevated(
                        onSelected: (value) => setState(() => selectedChip = index),
                        elevation: 2,
                        selected: index == selectedChip,
                        showCheckmark: false,
                        selectedColor: kSolidAccentColor,
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        label: categories[index].text.color(index == selectedChip ? Colors.white : Colors.black).make(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
