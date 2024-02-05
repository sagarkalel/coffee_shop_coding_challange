import 'package:first_challange_coffee_shop/data/coffee_model.dart';
import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/screens/coffee_details_screen/widgets/appbar.dart';
import 'package:first_challange_coffee_shop/screens/coffee_details_screen/widgets/buy_now_bottom_bar.dart';
import 'package:first_challange_coffee_shop/utils/constatnts/sizes.dart';
import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class CoffeeDetailsScreen extends StatelessWidget {
  const CoffeeDetailsScreen(
      {super.key, required this.coffeModel, this.isFromBanner = false});
  final CoffeeModel coffeModel;
  final bool isFromBanner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: MyAppbar(
            isTrailing: true,
            coffeeId: coffeModel.id,
            title: "Detail",
          )),
      bottomNavigationBar: BuyNowBottomBar(coffeModel: coffeModel),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
                  height: Sizes.screenY(context) * 0.25,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: ThemeColors.brownColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: coffeModel.image.isEmpty
                      ? const SizedBox.shrink()
                      : Hero(
                          tag: "${coffeModel.id}$isFromBanner",
                          child: FadeInImage(
                            placeholder: MemoryImage(kTransparentImage),
                            image: NetworkImage(coffeModel.image),
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ).clipRect(12),
                        ))
              .padYY(20),
          Text(coffeModel.coffeeType,
              style: Styles.titleLarge(context).weight(FontWeight.w600)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(coffeModel.mixedWith,
                      style: Styles.bodySmall(context)
                          .textColor(ThemeColors.hintText)),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star_rounded,
                          color: ThemeColors.amberColor, size: 18),
                      Text(
                        coffeModel.rating.toString(),
                        style:
                            Styles.titleMedium(context).weight(FontWeight.w600),
                      ),
                      Text(" (${coffeModel.ratingCount.toString()})",
                          style: Styles.bodySmall(context)
                              .textColor(ThemeColors.hintText)),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: coffeModel.mixedWithIcons
                    .map((e) => Container(
                          alignment: Alignment.center,
                          height: 44,
                          width: 44,
                          margin: const EdgeInsets.only(left: 12),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: ThemeColors.brownColor.withOpacity(0.15)),
                          child: Image.network(e),
                        ))
                    .toList(),
              ),
            ],
          ),
          yGap(12),
          const Divider(thickness: 1),
          yGap(10),
          Text("Description",
              style: Styles.titleMedium(context).weight(FontWeight.w600)),
          yGap(16),
          Text.rich(
            TextSpan(
              style: Styles.bodyMedium(context).textColor(ThemeColors.hintText),
              children: [
                TextSpan(text: coffeModel.desc),
              ],
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          yGap(16),
          Text("Size",
              style: Styles.titleMedium(context).weight(FontWeight.w600)),
          yGap(10),
          Consumer<MyProvider>(
            builder: (context, provider, child) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: provider.sizes.asMap().entries.map((e) {
                    String value = e.value;
                    int index = e.key;
                    int sizeIndex =
                        provider.getSelectedSizeIndex(coffeModel.id);

                    return OutlinedButton(
                      onPressed: () {
                        Map<String, int> value = {coffeModel.id: index};
                        provider.addSelectedSize(value: value);
                      },
                      style: OutlinedButton.styleFrom(
                          foregroundColor: index == sizeIndex
                              ? ThemeColors.brownColor
                              : ThemeColors.darkSecondaryText,
                          backgroundColor: index == sizeIndex
                              ? ThemeColors.brownColor.withOpacity(0.15)
                              : ThemeColors.secondaryWhite,
                          side: BorderSide(
                            color: index == sizeIndex
                                ? ThemeColors.brownColor
                                : ThemeColors.inActive(context),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      child: Text(value).padXX((Sizes.screenX(context)) / 18),
                    );
                  }).toList());
            },
          ),
        ],
      ).padXX(30),
    );
  }
}
