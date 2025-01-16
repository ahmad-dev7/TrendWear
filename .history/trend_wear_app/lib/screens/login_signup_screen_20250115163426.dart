import 'package:animate_do/animate_do.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:trend_wear_app/components/my_textfield.dart';
import 'package:trend_wear_app/components/my_toggle_switch.dart';
import 'package:trend_wear_app/components/signup_field.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:trend_wear_app/cubit/toggler_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

GlobalKey<FlipCardState> flipCardKey = GlobalKey<FlipCardState>();

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kScreenMargin),
      child: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => TogglerCubit(),
          child: FadeInDown(
            from: 200,
            child: Column(
              children: [
                HeightBox(kScreenMargin),
                Lottie.asset('assets/animations/optimized.json'),
                const MyToggleSwitch(),
                HeightBox(kScreenMargin),
                SignupField(
                  textField: MyTextField(
                    placeholder: 'Name',
                    inputType: TextInputType.name,
                    prefixIcon: CupertinoIcons.person,
                    onComplete: (_) {},
                  ),
                ),
                MyTextField(
                  placeholder: 'Email',
                  inputType: TextInputType.emailAddress,
                  prefixIcon: CupertinoIcons.mail,
                  onComplete: (_) {},
                ),
                const HeightBox(15),
                MyTextField(
                  placeholder: 'Password',
                  inputType: TextInputType.visiblePassword,
                  isPasswordField: true,
                  prefixIcon: CupertinoIcons.lock,
                  onComplete: (_) {},
                ),
                const HeightBox(15),
                SignupField(
                  textField: MyTextField(
                    placeholder: 'Confirm password',
                    inputType: TextInputType.visiblePassword,
                    prefixIcon: CupertinoIcons.lock_fill,
                    onComplete: (_) {},
                  ),
                ),
                CupertinoButton(
                  padding: const EdgeInsets.all(40),
                  child: BlocBuilder<TogglerCubit, bool>(
                    builder: (context, data) {
                      var label = data ? 'login' : 'Signup';
                      return AnimatedSwitcher(
                        duration: kAnimationDuration * 10,
                        child: VxBox(child: label.text.medium.white.makeCentered())
                            .size(double.maxFinite, 50)
                            .roundedSM
                            .withGradient(kGradient)
                            .make(),
                      );
                    },
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
