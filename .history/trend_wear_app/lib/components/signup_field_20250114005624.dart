import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend_wear_app/cubit/toggler_cubit.dart';

class SignupField extends StatefulWidget {
  final Widget child;
  const SignupField({super.key, required this.child});

  @override
  State<SignupField> createState() => _SignupFieldState();
}

class _SignupFieldState extends State<SignupField> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> slideAnimation;
  bool showChild = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Durations.long1,
    );

    slideAnimation = Tween<double>(begin: 0, end: -1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TogglerCubit, bool>(
      listener: (context, data) {
        if (!data && !showChild) {
          setState(() {
            showChild = true;
          });
          controller.forward();
        } else if (data && showChild) {
          controller.reverse().then((_) {
            setState(() {
              showChild = false;
            });
          });
        }
      },
      child: BlocBuilder<TogglerCubit, bool>(
        builder: (context, data) {
          return AnimatedBuilder(
            animation: slideAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(slideAnimation.value * MediaQuery.of(context).size.width, 0),
                child: Visibility(
                  visible: showChild,
                  child: Padding(padding: const EdgeInsets.only(bottom: 15), child: widget.child),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
