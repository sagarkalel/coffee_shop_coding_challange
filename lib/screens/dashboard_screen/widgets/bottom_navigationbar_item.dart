import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationbarItem extends StatelessWidget {
  const BottomNavigationbarItem(
      {super.key,
      required this.image,
      required this.index,
      required this.provider});
  final String image;
  final int index;
  final MyProvider provider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: index == provider.currentNavBar
          ? null
          : () => provider.currentNavBar = index,
      child: Column(
        children: [
          SvgPicture.asset(
            image,
            color: index == provider.currentNavBar
                ? ThemeColors.brownColor
                : ThemeColors.inActive(context),
          ),
          yGap(5),
          if (index == provider.currentNavBar)
            Container(
              height: 5,
              width: 10,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                ThemeColors.primaryText,
                ThemeColors.brownColor,
              ])),
            ),
        ],
      ).padAll(12),
    );
  }
}
