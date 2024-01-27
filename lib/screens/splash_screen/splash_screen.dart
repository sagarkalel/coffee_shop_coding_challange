import 'package:first_challange_coffee_shop/utils/constatnts/routes_constants.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000)).then((value) =>
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.dashboardScreen, (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome to coffee shop!",
          style: Styles.headlineLarge(context),
        ),
      ),
    );
  }
}
