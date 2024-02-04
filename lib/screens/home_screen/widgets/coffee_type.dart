import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeeType extends StatelessWidget {
  const CoffeeType({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, child) {
        List newList = ["All", ...provider.coffeeType];
        return ListView.builder(
          itemCount: newList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: provider.selectedCoffeeType == newList[index]
                  ? null
                  : () {
                      provider.selectedCoffeeType = newList[index];
                      FocusScope.of(context).unfocus();
                    },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(vertical: 3),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: provider.selectedCoffeeType.isNotEmpty
                      ? (provider.selectedCoffeeType == newList[index]
                          ? ThemeColors.brownColor
                          : ThemeColors.primaryWhite)
                      : index == 0
                          ? ThemeColors.brownColor
                          : ThemeColors.primaryWhite,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: ThemeColors.primaryBlack.withOpacity(0.2),
                        blurRadius: 2,
                        offset: const Offset(2, 2))
                  ],
                ),
                child: Text(
                  newList[index],
                  style: Styles.bodyLarge(context).textColor(
                      provider.selectedCoffeeType == newList[index]
                          ? ThemeColors.primaryText
                          : ThemeColors.darkSecondaryText),
                ),
              ),
            )
                .padXLeft(index == 0 ? 30 : 8)
                .padXRight(index == newList.length - 1 ? 8 : 0);
          },
        );
      },
    );
  }
}
