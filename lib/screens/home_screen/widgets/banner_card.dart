import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_challange_coffee_shop/data/coffee_model.dart';
import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/screens/coffee_details_screen/coffee_details_screen.dart';
import 'package:first_challange_coffee_shop/utils/constatnts/sizes.dart';
import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, child) {
        List<CoffeeModel> allCoffeeContainsBanner = provider.allCoffees
            .where((element) => element.banner.enable == true)
            .toList();
        debugPrint("this is banner length: ${allCoffeeContainsBanner.length}");
        return CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1,
            height: 140,
          ),
          items: allCoffeeContainsBanner
              .map((coffee) => Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CoffeeDetailsScreen(
                                  coffeModel: coffee, isFromBanner: true))),
                      child: Container(
                        height: 140,
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        width: Sizes.screenX(context) - 60,
                        decoration: BoxDecoration(
                          color: ThemeColors.greyColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            if (coffee.image.isNotEmpty)
                              Hero(
                                tag: '${coffee.id}banner',
                                child: FadeInImage(
                                  placeholder: MemoryImage(kTransparentImage),
                                  image: NetworkImage(coffee.image),
                                  fit: BoxFit.cover,
                                ).clipRect(16),
                              ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 6),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: ThemeColors.redColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        'Promo',
                                        style: Styles.bodyLarge(context)
                                            .textColor(ThemeColors.primaryWhite)
                                            .weight(FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  coffee.banner.desc,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w600,
                                      color: ThemeColors.primaryWhite,
                                      backgroundColor:
                                          ThemeColors.secondaryBlack,
                                      wordSpacing: 4,
                                      shadows: [
                                        Shadow(
                                            color: ThemeColors.secondaryText,
                                            offset: const Offset(2, 2))
                                      ]),
                                ).padXRight(100)
                              ],
                            ).padXX(24).padYY(13),
                          ],
                        ),
                      ),
                    ),
                  ))
              .toList(),
        );
      },
    );
  }
}
