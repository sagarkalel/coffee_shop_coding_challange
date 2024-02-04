import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  const CoffeeTile(
      {super.key,
      required this.coffeeType,
      required this.mixedWith,
      required this.price,
      required this.rating,
      required this.onAddCallback});
  final String coffeeType, mixedWith;
  final double price, rating;
  final VoidCallback onAddCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ThemeColors.primaryWhite,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: ThemeColors.primaryBlack.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(4, 4))
          ]),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 152,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(16)),
              ),
              yGap(8),
              Text(
                coffeeType,
                style: Styles.titleMedium(context).weight(FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              ).padXX(12),
              Text(
                "with $mixedWith",
                style:
                    Styles.titleSmall(context).textColor(ThemeColors.hintText),
                overflow: TextOverflow.ellipsis,
              ).padXX(12),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ ${price.toStringAsFixed(2)}",
                    style: Styles.titleMedium(context).weight(FontWeight.w600),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: onAddCallback,
                    child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          color: ThemeColors.brownColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color:
                                    ThemeColors.primaryBlack.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(2, 2))
                          ],
                        ),
                        child: Icon(
                          Icons.add,
                          color: ThemeColors.primaryWhite,
                        )),
                  )
                ],
              ).padYBottom(12).padXX(12)
            ],
          ),
          Container(
            height: 30,
            width: 60,
            margin: const EdgeInsets.all(4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
              color: ThemeColors.primaryBlack.withOpacity(0.16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star_rounded,
                    color: ThemeColors.amberColor, size: 18),
                Text(
                  rating.toStringAsFixed(1),
                  style: Styles.titleMedium(context)
                      .textColor(ThemeColors.primaryWhite),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
