import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        leading: Icon(CupertinoIcons.line_horizontal_3_decrease),
      ),
      child: SingleChildScrollView(
        child: "Hello".text.makeCentered().box.height(1500).make(),
      ),
    );
  }
}
