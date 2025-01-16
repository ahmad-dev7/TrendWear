import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:trend_wear_app/cubit/bottom_navigation_cubit.dart';
import 'package:trend_wear_app/cubit/login_cubit.dart';
import 'package:trend_wear_app/cubit/signup_cubit.dart';
import 'package:trend_wear_app/cubit/toggler_cubit.dart';
import 'package:trend_wear_app/cubit/token_cubit.dart';
import 'package:trend_wear_app/screens/home_screen.dart';
import 'package:trend_wear_app/screens/login_signup_screen.dart';
import 'package:velocity_x/velocity_x.dart';

void main() async {
  kSharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TogglerCubit()), //* For Toggle Switch of Login/Signup section
        BlocProvider(create: (_) => LoginCubit()), //* For managing Login states
        BlocProvider(create: (_) => SignupCubit()), //* For managing Signup states
        BlocProvider(create: (_) => JwtTokenCubit()), //* For managing JwtToken
        BlocProvider(create: (_) => BottomNavigationCubit()), //* For managing Bottom Navigation active item
      ],
      child: BlocConsumer<JwtTokenCubit, JwtTokenState>(
        listener: (context, state) {
          if (state is JwtTokenExpired) {
            kSharedPreferences.clear();
            print("should show dialogue");
            showDialog(
              context: context,
              builder: (_) {
                return CupertinoAlertDialog(
                  title: "Your session has expired".text.make(),
                  content: "Please login again".text.make(),
                );
              },
            );
          }
        },
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(scaffoldBackgroundColor: const Color(0xFFf0f0f0)),
          home: state is JwtTokenExpired ? const LoginSignupScreen() : const HomeScreen(),
        ),
      ),
    );
  }
}
