import 'package:first_challange_coffee_shop/data/coffee_model.dart';
import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/screens/confirm_order_screen/widgets/address_bottomsheet.dart';
import 'package:first_challange_coffee_shop/utils/constatnts/sizes.dart';
import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class OrderNowBottomBar extends StatelessWidget {
  const OrderNowBottomBar({super.key, required this.coffeeModel});
  final CoffeeModel coffeeModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 161,
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
      child: Column(
        children: [
          Row(
            children: [
              FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: const AssetImage("assets/icons/moneys.png"),
                  height: 24,
                  width: 24),
              xGap(12),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: ThemeColors.brownColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Cash",
                        style: Styles.bodyMedium(context)
                            .textColor(ThemeColors.primaryWhite),
                      ),
                    ),
                    xGap(10),
                    Consumer<MyProvider>(
                      builder: (context, provider, child) {
                        double price = provider.getMapFinalDataToDisplay(
                            coffeeModel)['totalPriceToDisplay'];

                        return Text("\$ ${price.toStringAsFixed(2)}");
                      },
                    ),
                    xGap(10),
                  ],
                ),
              ),
              const Spacer(),
              Tooltip(
                message: "More options",
                child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: const AssetImage("assets/icons/dots.png"),
                    height: 24,
                    width: 24),
              ),
            ],
          ).padYY(16),
          SizedBox(
            width: Sizes.screenX(context) - 60,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  showDragHandle: true,
                  isScrollControlled: true,
                  constraints:
                      BoxConstraints(maxHeight: Sizes.screenY(context) * .75),
                  context: context,
                  builder: (context) {
                    return const AddressBottomsheet(
                        title: "Your order has successfully placed!");
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: ThemeColors.primaryWhite,
                backgroundColor: ThemeColors.brownColor,
                textStyle: Styles.titleLarge(context).weight(FontWeight.w600),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text("Confirm Order"),
            ),
          )
        ],
      ).padXX(30),
    );
  }
}
