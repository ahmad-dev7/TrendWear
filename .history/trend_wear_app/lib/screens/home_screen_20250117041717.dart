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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 120,
              title: const Text("Categories"),
              backgroundColor: Colors.transparent,
              flexibleSpace: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(left: kScreenMargin, right: index == categories.length - 1 ? 20 : 0),
                  child: ChoiceChip.elevated(
                    elevation: .2,
                    pressElevation: 5,
                    showCheckmark: false,
                    selected: index == selectedChip,
                    selectedColor: kSolidAccentColor,
                    backgroundColor: Colors.white,
                    onSelected: (value) => setState(() => selectedChip = index),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    label: Text(categories[index]),
                  ),
                ),
              ),
            ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     HeightBox(kScreenMargin),
            //     "Categories".text.bold.size(35).textStyle(GoogleFonts.montserrat()).make().pad.px20.make(),
            //     HeightBox(kScreenMargin * 0.5),
            //     SizedBox(
            //       height: 45,
            //       child: ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         itemCount: categories.length,
            //         itemBuilder: (context, index) => Padding(
            //           padding: EdgeInsets.only(left: kScreenMargin, right: index == categories.length - 1 ? 20 : 0),
            //           child: ChoiceChip.elevated(
            //             elevation: .2,
            //             pressElevation: 5,
            //             showCheckmark: false,
            //             selected: index == selectedChip,
            //             selectedColor: kSolidAccentColor,
            //             backgroundColor: Colors.white,
            //             onSelected: (value) => setState(() => selectedChip = index),
            //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            //             label: categories[index].text.black.color(index == selectedChip ? Colors.white : null).make(),
            //           ),
            //         ),
            //       ),
            //     ),
            //     HeightBox(kScreenMargin * 0.5),
            //     GridView.builder(
            //       itemCount: 50,
            //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         crossAxisSpacing: 10,
            //         mainAxisSpacing: 10,
            //       ),
            //       itemBuilder: (_, i) {
            //         return AspectRatio(
            //           aspectRatio: 9 / 16, // Adjust this ratio as needed
            //           child: VxBox().roundedSM.color(kSolidAccentColor).make().pad.p20.make(),
            //         );
            //       },
            //     ).box.height(context.screenHeight * 1.2).make(),
            //   ],
            // ),
          ],
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
