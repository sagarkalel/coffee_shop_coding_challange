import 'package:first_challange_coffee_shop/screens/home_screen/widgets/coffee_tile.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class CoffeeTileGridview extends StatelessWidget {
  const CoffeeTileGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 150 / 239),
      itemCount: 5,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      itemBuilder: (context, index) {
        return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {},
            child: CoffeeTile(
              coffeeType: "Capituno",
              mixedWith: "steam milk",
              price: 4.6,
              rating: 4,
              onAddCallback: () {},
            )).padXRight(16).padYBottom(16);
      },
    );
  }
}
