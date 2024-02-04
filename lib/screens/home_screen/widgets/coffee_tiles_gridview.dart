import 'package:first_challange_coffee_shop/data/coffee_model.dart';
import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/screens/coffee_details_screen/coffee_details_screen.dart';
import 'package:first_challange_coffee_shop/screens/home_screen/widgets/coffee_tile.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeeTileGridview extends StatelessWidget {
  const CoffeeTileGridview({super.key, this.isForFavorite = false});
  final bool isForFavorite;

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, child) {
        List<CoffeModel> coffeeList = provider.allCoffees;
        if (isForFavorite) {
          coffeeList = coffeeList
              .where((element) => provider.allLikedCoffees.contains(element.id))
              .toList();
        } else {
          if (provider.selectedCoffeeType.isEmpty ||
              provider.selectedCoffeeType == "All") {
            coffeeList = coffeeList;
          } else {
            coffeeList = coffeeList
                .where((element) => element.coffeeType
                    .toLowerCase()
                    .contains(provider.selectedCoffeeType.toLowerCase()))
                .toList();
          }
          if (provider.searchController.text.isNotEmpty) {
            coffeeList = coffeeList
                .where((element) => element.coffeeType
                    .toLowerCase()
                    .contains(provider.searchController.text.toLowerCase()))
                .toList();
          }
        }
        if (coffeeList.isEmpty) {
          return Center(
            child: Text(
              "Sorry, No Coffee found!",
              style: Styles.headlineSmall(context),
            ).padYTop(50),
          );
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 150 / 239),
          itemCount: coffeeList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          itemBuilder: (context, index) {
            CoffeModel currentCoffee = coffeeList[index];

            return InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CoffeeDetailsScreen(
                          coffeModel: currentCoffee,
                        ),
                      ));
                },
                child: CoffeeTile(
                  coffeeType: currentCoffee.coffeeType,
                  mixedWith: currentCoffee.mixedWith,
                  price: currentCoffee.price.toDouble(),
                  rating: currentCoffee.rating.toDouble(),
                  onAddCallback: () {},
                )).padXRight(16).padYBottom(16);
          },
        );
      },
    );
  }
}
