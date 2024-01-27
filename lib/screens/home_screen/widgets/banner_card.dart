import 'package:first_challange_coffee_shop/utils/constatnts/sizes.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      width: Sizes.screenX(context) - 60,
      decoration: BoxDecoration(
          color: ThemeColors.greyColor,
          borderRadius: BorderRadius.circular(16)),
    );
  }
}
