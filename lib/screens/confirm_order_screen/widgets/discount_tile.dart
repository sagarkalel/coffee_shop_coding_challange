import 'package:first_challange_coffee_shop/data/coffee_model.dart';
import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/screens/confirm_order_screen/widgets/discounts_bottomsheet.dart';
import 'package:first_challange_coffee_shop/utils/constatnts/sizes.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class DiscountTile extends StatelessWidget {
  const DiscountTile({super.key, required this.coffeeModel});
  final CoffeeModel coffeeModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        showModalBottomSheet(
          context: context,
          showDragHandle: true,
          constraints: BoxConstraints(maxHeight: Sizes.screenY(context) * 6),
          builder: (context) => DiscountBottomsheet(coffeeModel: coffeeModel),
        );
      },
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: ThemeColors.hintText.withOpacity(0.3))),
        child: Row(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: const AssetImage("assets/icons/discount.png"),
              height: 24,
              width: 24,
            ),
            xGap(12),
            Expanded(
              child: Consumer<MyProvider>(
                builder: (context, provider, child) {
                  int offersCount = provider.allFetchedOffers.length;
                  String selectedSize = provider
                      .sizes[provider.getSelectedSizeIndex(coffeeModel.id)];
                  int numberOfItemsAdded =
                      provider.getNumberOfItemsAdded(coffeeModel.id);

                  double priceInDouble = coffeeModel.price.s;
                  if (selectedSize.toLowerCase() == 's') {
                    priceInDouble = coffeeModel.price.s;
                  } else if (selectedSize.toLowerCase() == 'm') {
                    priceInDouble = coffeeModel.price.m;
                  } else if (selectedSize.toLowerCase() == 'l') {
                    priceInDouble = coffeeModel.price.l;
                  }
                  double totalPrice = priceInDouble * numberOfItemsAdded +
                      coffeeModel.deliveryFee;
                  int numberOfOffersApplied = provider.allFetchedOffers
                      .where((element) {
                        if (element.discountOn == 'order') {
                          return element.minPrice <= totalPrice;
                        } else {
                          return element.minOrder <= numberOfItemsAdded;
                        }
                      })
                      .toList()
                      .length;
                  if (numberOfOffersApplied == 0) {
                    return Text(
                      "$offersCount Discounts can be applied!",
                      style: Styles.titleMedium(context),
                    );
                  }
                  return Text(
                    "$numberOfOffersApplied Discount is applied",
                    style: Styles.titleMedium(context),
                  );
                },
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 20)
          ],
        ).padXX(16),
      ),
    );
  }
}
