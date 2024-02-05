import 'package:first_challange_coffee_shop/data/coffee_model.dart';
import 'package:first_challange_coffee_shop/screens/confirm_order_screen/widgets/address_bar.dart';
import 'package:first_challange_coffee_shop/screens/confirm_order_screen/widgets/discount_tile.dart';
import 'package:first_challange_coffee_shop/screens/confirm_order_screen/widgets/payment_summary.dart';
import 'package:first_challange_coffee_shop/screens/confirm_order_screen/widgets/plus_minus_coffee_tile.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:flutter/material.dart';

class DeliverTab extends StatelessWidget {
  const DeliverTab({super.key, required this.coffeModel});
  final CoffeeModel coffeModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AddressBar().padXX(30),
          yGap(10),
          PlusMinusCoffeeTile(coffeModel: coffeModel).padXX(30),
          yGap(10),
          Divider(thickness: 4, color: ThemeColors.hintText.withOpacity(0.2)),
          yGap(10),
          DiscountTile(coffeeModel: coffeModel).padXX(30),
          yGap(10),
          PaymentSummary(coffeeModel: coffeModel).padXX(30),
        ],
      ).padYY(16),
    ).padYY(8);
  }
}
