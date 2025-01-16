import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:trend_wear_app/cubit/bottom_navigation_cubit.dart';
import 'package:trend_wear_app/cubit/login_cubit.dart';
import 'package:trend_wear_app/cubit/signup_cubit.dart';
import 'package:trend_wear_app/cubit/toggler_cubit.dart';
import 'package:trend_wear_app/screens/home_screen.dart';
import 'package:trend_wear_app/screens/login_signup_screen.dart';

void main() async {
  kSharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var token = kSharedPreferences.getString("jwtToken");
    kSharedPreferences.remove("jwtToken");
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TogglerCubit()),
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => SignupCubit()),
        BlocProvider(create: (_) => BottomNavigationCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(scaffoldBackgroundColor: const Color(0xFFf0f0f0)),
        home: token == null ? const LoginSignupScreen() : const HomeScreen(),
      ),
    );
  }
}
