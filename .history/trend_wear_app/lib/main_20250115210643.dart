import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend_wear_app/cubit/bottom_navigation_cubit.dart';
import 'package:trend_wear_app/cubit/login_cubit.dart';
import 'package:trend_wear_app/cubit/signup_cubit.dart';
import 'package:trend_wear_app/cubit/toggler_cubit.dart';
import 'package:trend_wear_app/screens/login_signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TogglerCubit()),
        BlocProvider(create: (_) => BottomNavigationCubit()),
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => SignupCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(scaffoldBackgroundColor: const Color(0xFFf0f0f0)),
        home: const LoginSignupScreen(),
      ),
    );
  }
}
