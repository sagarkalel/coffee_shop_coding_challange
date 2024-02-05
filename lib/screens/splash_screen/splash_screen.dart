import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_challange_coffee_shop/utils/constatnts/routes_constants.dart';
import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 2000));
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? value = prefs.getString("uid");

      checkNavigation(value);
    });
  }

  checkNavigation(String? value) {
    User? user = FirebaseAuth.instance.currentUser;

    if ((value == null || value.isEmpty) || user == null) {
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.phoneInputScreen, (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.dashboardScreen, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.coffee,
              size: 150,
              color: ThemeColors.brownColor.withOpacity(0.2),
            ),
            xGap(16),
            Text(
              "Welcome to coffee shop!",
              style: Styles.headlineLarge(context).weight(FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
