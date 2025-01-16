import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:trend_wear_app/cubit/bottom_navigation_cubit.dart';
import 'package:trend_wear_app/cubit/login_cubit.dart';
import 'package:trend_wear_app/cubit/signup_cubit.dart';
import 'package:trend_wear_app/cubit/toggler_cubit.dart';
import 'package:trend_wear_app/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        BlocProvider(create: (_) => BottomNavigationCubit()), //* For managing Bottom Navigation active item
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(scaffoldBackgroundColor: const Color(0xFFf0f0f0)),
        home: const SplashScreen(),
      ),
    );
  }
}
