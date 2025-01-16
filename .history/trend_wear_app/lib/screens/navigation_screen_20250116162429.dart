import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:trend_wear_app/screens/favorite_screen.dart';
import 'package:trend_wear_app/screens/home_screen.dart';
import 'package:trend_wear_app/screens/profile_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:trend_wear_app/cubit/bottom_navigation_cubit.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavigationCubit, int>(builder: (context, state) {
        return IndexedStack(
          index: state,
          children: [
            //Fav Screen
            SlideInLeft(child: const FavoriteScreen()),
            //Home Screen
            const HomeScreen(),
            // Profile Screen
            const ProfileScreen(),
          ],
        );
      }),
      bottomNavigationBar: BlocBuilder<BottomNavigationCubit, int>(
        builder: (context, currentIndex) {
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
        },
      ),
    );
  }
}
