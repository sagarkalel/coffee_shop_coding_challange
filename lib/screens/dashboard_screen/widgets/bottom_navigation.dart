import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/screens/dashboard_screen/widgets/bottom_navigationbar_item.dart';
import 'package:first_challange_coffee_shop/utils/constatnts/asset_constants.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, child) {
        return Container(
          height: 75,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ThemeColors.primanyWhite,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: ThemeColors.secondaryBlack.withOpacity(0.1),
                blurRadius: 8,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomNavigationbarItem(
                  image: Assets.homeIcon, index: 0, provider: provider),
              BottomNavigationbarItem(
                  image: Assets.heartIcon, index: 1, provider: provider),
              BottomNavigationbarItem(
                  image: Assets.bagIcon, index: 2, provider: provider),
              BottomNavigationbarItem(
                  image: Assets.notificationIcon, index: 3, provider: provider),
            ],
          ),
        );
      },
    );
  }
}
