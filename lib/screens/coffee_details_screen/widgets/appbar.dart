import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/services/api_services.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({
    super.key,
    this.isTrailing = false,
    required this.coffeeId,
    required this.title,
  });
  final bool isTrailing;
  final String coffeeId, title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: ThemeColors.scaffoldBackgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          Text(
            title,
            style: Styles.titleLarge(context).weight(FontWeight.w600),
          ),
          if (isTrailing)
            Consumer<MyProvider>(
              builder: (context, provider, child) {
                bool isLiked = ApiServices.isGivenCoffeeIdLiked(
                    coffeeId: coffeeId, provider: provider);
                return IconButton(
                  icon: Icon(isLiked
                      ? Icons.favorite
                      : Icons.favorite_border_outlined),
                  onPressed: () async {
                    await ApiServices.updateFavoriteCoffee(context, coffeeId);
                  },
                );
              },
            )
          else
            xGap(25)
        ],
      ),
    );
  }
}
