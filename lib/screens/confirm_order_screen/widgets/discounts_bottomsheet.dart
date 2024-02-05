import 'package:first_challange_coffee_shop/data/coffee_model.dart';
import 'package:first_challange_coffee_shop/data/offer_model.dart';
import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/utils/constatnts/sizes.dart';
import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class DiscountBottomsheet extends StatelessWidget {
  const DiscountBottomsheet({super.key, required this.coffeeModel});
  final CoffeeModel coffeeModel;

  @override
  Widget build(BuildContext context) {
    MyProvider provider = MyProvider();
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.discount_outlined,
                color: ThemeColors.brownColor, size: 18),
            Text(
              "Best Discounts for you".toUpperCase(),
              style: Styles.titleMedium(context).weight(FontWeight.w600),
            ).padXX(8),
            Icon(Icons.discount_outlined,
                color: ThemeColors.brownColor, size: 18)
          ],
        ),
        yGap(16),
        Expanded(
          child: ListView.builder(
            itemCount: provider.allFetchedOffers.length,
            itemBuilder: (context, index) {
              OfferModel offer = provider.allFetchedOffers[index];
              bool isForDelivery = offer.discountOn == 'delivery';
              String selectedSize =
                  provider.sizes[provider.getSelectedSizeIndex(coffeeModel.id)];
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
              double totalPrice =
                  priceInDouble * numberOfItemsAdded + coffeeModel.deliveryFee;
              bool currentOfferApplied = false;
              int itemsNeededToEligibleForOffer =
                  numberOfItemsAdded >= offer.minOrder
                      ? 0
                      : offer.minOrder - numberOfItemsAdded;
              double priceNeededMoreForEligible = totalPrice >= offer.minPrice
                  ? 0
                  : offer.minPrice - totalPrice;
              if (isForDelivery) {
                currentOfferApplied = offer.minOrder <= numberOfItemsAdded;
              } else {
                currentOfferApplied = offer.minPrice <= totalPrice;
              }

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                decoration: BoxDecoration(
                    color: ThemeColors.primaryWhite,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.055),
                        offset: const Offset(2, 2),
                        spreadRadius: 2,
                        blurRadius: 2,
                      )
                    ]),
                child: Row(
                  children: [
                    !currentOfferApplied
                        ? FadeInImage(
                            placeholder: MemoryImage(kTransparentImage),
                            image:
                                const AssetImage("assets/icons/discount.png"),
                            height: 24,
                            width: 24,
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 10,
                            child: Icon(Icons.done,
                                size: 14, color: ThemeColors.primaryWhite)),
                    xGap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Sizes.screenX(context) * 0.66,
                              child: Text(
                                isForDelivery
                                    ? "Get ${offer.discount}% flat off on buying more than ${offer.minOrder} coffees."
                                    : "Get ${offer.discount}% flat off on orders of more than \$${offer.minPrice} price.",
                                style: Styles.titleMedium(context),
                                maxLines: 2,
                              ),
                            )
                          ],
                        ),
                        currentOfferApplied
                            ? Text(
                                " This discount is applied",
                                style: Styles.bodyMedium(context)
                                    .textColor(ThemeColors.hintText),
                              )
                            : isForDelivery
                                ? Text(
                                    "Add $itemsNeededToEligibleForOffer more items to eligible for this offer!",
                                    style: Styles.bodyMedium(context)
                                        .textColor(ThemeColors.hintText),
                                  )
                                : Text(
                                    "Buy (\$${priceNeededMoreForEligible.toStringAsFixed(2)})'s of more items to eligible for this offer!",
                                    style: Styles.bodyMedium(context)
                                        .textColor(ThemeColors.hintText),
                                  )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ).padYY(30);
  }
}
