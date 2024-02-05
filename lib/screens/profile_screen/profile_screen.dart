import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/utils/constatnts/routes_constants.dart';
import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/services/api_services.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ThemeColors.scaffoldBackgroundColor,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
            Text(
              "Profile details",
              style: Styles.titleLarge(context).weight(FontWeight.w600),
            ),
          ],
        ),
      ),
      body: Consumer<MyProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 75,
                    child: Icon(
                      Icons.person,
                      size: 75,
                      color: ThemeColors.greyColor.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              yGap(30),
              Text(
                provider.userName,
                style: Styles.titleLarge(context),
              ),
              Text(
                "(${ApiServices.phoneNumberToDisplay(provider.phoneNumber)})",
                style: Styles.titleSmall(context),
              ),
              yGap(75),
              ElevatedButton(
                  onPressed: () => logoutAlert(context, provider),
                  child: const Text("LougOut"))
            ],
          ).padAll(30);
        },
      ),
    );
  }

  void logoutAlert(context, MyProvider provider) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Column(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                size: 75,
                color: ThemeColors.amberColor,
              ),
              const Text("Attention!"),
            ],
          ),
          content: const Text("Do you really want to logout?"),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel")),
            TextButton(
                onPressed: () {
                  provider.signOut().then((value) =>
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoutes.splashScreen, (route) => false));
                },
                child: const Text("Yes")),
          ],
        );
      },
    );
  }
}
