import 'package:first_challange_coffee_shop/data/coffee_model.dart';
import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class PlusMinusCoffeeTile extends StatelessWidget {
  const PlusMinusCoffeeTile({super.key, required this.coffeModel});
  final CoffeeModel coffeModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, child) {
        int numberOfItemsAdded = provider.getNumberOfItemsAdded(coffeModel.id);
        return Row(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(coffeModel.image),
              height: 54,
              width: 54,
              fit: BoxFit.cover,
            ).clipRect(12),
            xGap(12),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(coffeModel.coffeeType,
                    style: Styles.titleMedium(context).weight(FontWeight.w600)),
                Text(coffeModel.mixedWith,
                    style: Styles.titleSmall(context)
                        .textColor(ThemeColors.hintText)),
              ],
            ),
            const Spacer(),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: numberOfItemsAdded <= 1
                  ? null
                  : () => provider.removeItemFromOrder(coffeModel.id),
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: ThemeColors.hintText)),
                child: Icon(
                  Icons.remove,
                  size: 16,
                  color: numberOfItemsAdded > 1
                      ? ThemeColors.primaryBlack
                      : ThemeColors.hintText,
                ),
              ),
            ),
            Text(numberOfItemsAdded.toString(),
                    style: Styles.titleMedium(context).weight(FontWeight.w600))
                .padXX(14),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => provider.addItemInOrder(coffeModel.id),
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: ThemeColors.hintText)),
                child: const Icon(
                  Icons.add,
                  size: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
