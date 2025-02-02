import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:trend_wear_app/cubit/bottom_navigation_cubit.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? name = kSharedPreferences.getString("name");
  String? token = kSharedPreferences.getString("jwtToken");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Hello, $name".text.semiBold.make(),
        backgroundColor: kLightAccentColor,
        bottom: PreferredSize(
          preferredSize: const Size(double.maxFinite, 2),
          child: VxBox().height(3).color(kSolidAccentColor).make(),
        ),
      ),
      body: VxBox().makeCentered(),
      bottomNavigationBar: BlocBuilder<BottomNavigationCubit, int>(builder: (context, currentIndex) {
        return SalomonBottomBar(
          onTap: (clickedIndex) => context.read<BottomNavigationCubit>().updateIndex(clickedIndex),
          currentIndex: currentIndex,
          selectedColorOpacity: 1,
          selectedItemColor: Colors.white,
          backgroundColor: kSolidAccentColor,
          items: List.generate(
            kBottomNavigationData.length,
            (index) => SalomonBottomBarItem(
              icon: Icon(
                kBottomNavigationData[index]!.iconData,
                color: index == currentIndex ? kLightAccentColor : Colors.white70,
              ),
              title: kBottomNavigationData[index]!.label.text.color(kSolidAccentColor).makeCentered(),
            ),
          ),
        );
      }),
    );
  }
}
