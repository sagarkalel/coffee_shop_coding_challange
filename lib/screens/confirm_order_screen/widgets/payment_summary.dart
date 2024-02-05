import 'package:first_challange_coffee_shop/data/coffee_model.dart';
import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({super.key, required this.coffeeModel});
  final CoffeeModel coffeeModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, child) {
        // String selectedSize =
        //     provider.sizes[provider.getSelectedSizeIndex(coffeeModel.id)];
        // int numberOfItemsAdded = provider.getNumberOfItemsAdded(coffeeModel.id);

        // double priceInDouble = coffeeModel.price.s;
        // if (selectedSize.toLowerCase() == 's') {
        //   priceInDouble = coffeeModel.price.s;
        // } else if (selectedSize.toLowerCase() == 'm') {
        //   priceInDouble = coffeeModel.price.m;
        // } else if (selectedSize.toLowerCase() == 'l') {
        //   priceInDouble = coffeeModel.price.l;
        // }
        // double totalPrice =
        //     priceInDouble * numberOfItemsAdded + coffeeModel.deliveryFee;
        // bool isDeleveryOfferApplied = provider.allFetchedOffers
        //     .where((element) {
        //       if (element.discountOn == 'delivery') {
        //         return element.minPrice <= totalPrice;
        //       } else {
        //         return false;
        //       }
        //     })
        //     .toList()
        //     .isNotEmpty;
        // bool isOrderOfferApplied = provider.allFetchedOffers
        //     .where((element) {
        //       if (element.discountOn == 'order') {
        //         return element.minOrder <= numberOfItemsAdded;
        //       } else {
        //         return false;
        //       }
        //     })
        //     .toList()
        //     .isNotEmpty;
        // double discountOnOrder = provider.allFetchedOffers
        //     .firstWhere((element) => element.discountOn == 'order')
        //     .discount;
        // double discountOnDelivery = provider.allFetchedOffers
        //     .firstWhere((element) => element.discountOn == 'delivery')
        //     .discount;
        // double discountedAmmountOnOrders = 0;
        // if (isOrderOfferApplied) {
        //   discountedAmmountOnOrders =
        //       coffeeModel.deliveryFee * discountOnOrder / 100;
        // }
        // double discountAmmountOnDelivery = 0;
        // if (isDeleveryOfferApplied) {
        //   discountAmmountOnDelivery = priceInDouble * discountOnDelivery / 100;
        // }

        // double priceToDisplay = priceInDouble - discountAmmountOnDelivery;
        // double deliveryFeeToDisplay =
        //     coffeeModel.deliveryFee - discountedAmmountOnOrders;
        // double totalPriceToDisplay = totalPrice -
        //     (discountAmmountOnDelivery + discountedAmmountOnOrders);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment Summary",
              style: Styles.titleMedium(context).weight(FontWeight.w600),
            ),
            yGap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Price",
                      style: Styles.titleSmall(context),
                    ),
                    xGap(8),
                    Text(
                      "(${provider.getMapFinalDataToDisplay(coffeeModel)['selectedSize']})",
                      style: Styles.bodyMedium(context),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (provider.getMapFinalDataToDisplay(
                        coffeeModel)['isDeleveryOfferApplied'])
                      Text(
                          "\$ ${provider.getMapFinalDataToDisplay(coffeeModel)['discountAmmountOnDelivery'].toStringAsFixed(2)}",
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                          )),
                    xGap(8),
                    Text(
                      "(${provider.getMapFinalDataToDisplay(coffeeModel)['numberOfItemsAdded']}) x",
                      style: Styles.bodyMedium(context),
                    ),
                    xGap(8),
                    Text(
                        "\$ ${provider.getMapFinalDataToDisplay(coffeeModel)['priceToDisplay'].toStringAsFixed(2)}",
                        style:
                            Styles.titleSmall(context).weight(FontWeight.w600)),
                  ],
                ),
              ],
            ),
            yGap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery Fee", style: Styles.titleSmall(context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (provider.getMapFinalDataToDisplay(
                        coffeeModel)['isOrderOfferApplied'])
                      Text(
                          "\$ ${provider.getMapFinalDataToDisplay(coffeeModel)['discountedAmmountOnOrders'].toStringAsFixed(2)}",
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                          )),
                    xGap(8),
                    Text(
                      "\$ ${provider.getMapFinalDataToDisplay(coffeeModel)['deliveryFeeToDisplay'].toStringAsFixed(2)}",
                      style: Styles.titleSmall(context).weight(FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
            yGap(10),
            const Divider(),
            yGap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Payment",
                  style: Styles.titleSmall(context),
                ),
                Text(
                    "\$ ${provider.getMapFinalDataToDisplay(coffeeModel)['totalPriceToDisplay'].toStringAsFixed(2)}",
                    style: Styles.titleSmall(context).weight(FontWeight.w600)),
              ],
            )
          ],
        );
      },
    );
  }
}
