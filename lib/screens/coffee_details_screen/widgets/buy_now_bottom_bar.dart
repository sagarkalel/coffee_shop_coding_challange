import 'package:first_challange_coffee_shop/data/coffee_model.dart';
import 'package:first_challange_coffee_shop/utils/constatnts/sizes.dart';
import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';

class BuyNowBottomBar extends StatelessWidget {
  const BuyNowBottomBar({super.key, required this.coffeModel});
  final CoffeModel coffeModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 121,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ThemeColors.primaryWhite,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                  color: ThemeColors.primaryBlack.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(4, 4))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Price",
                  style: Styles.titleSmall(context)
                      .textColor(ThemeColors.hintText),
                ),
                Text(
                  "\$ ${coffeModel.price.toStringAsFixed(2)}",
                  style: Styles.headlineSmall(context)
                      .textColor(ThemeColors.brownColor)
                      .weight(FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              width: Sizes.screenX(context) * 0.6,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: ThemeColors.primaryWhite,
                  backgroundColor: ThemeColors.brownColor,
                  textStyle: Styles.titleLarge(context).weight(FontWeight.w600),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text("Buy Now"),
              ),
            )
          ],
        ).padXX(30),
      ),
    );
  }
}
