import 'package:first_challange_coffee_shop/data/coffee_model.dart';
import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/screens/coffee_details_screen/coffee_details_screen.dart';
import 'package:first_challange_coffee_shop/screens/home_screen/widgets/coffee_tile.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeeTileGridview extends StatelessWidget {
  const CoffeeTileGridview(
      {super.key, this.isForFavorite = false, this.isForCart = false});
  final bool isForFavorite, isForCart;

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, child) {
        List<CoffeeModel> coffeeList = provider.allCoffees;
        if (isForFavorite) {
          coffeeList = coffeeList
              .where((element) => provider.allLikedCoffees.contains(element.id))
              .toList();
        } else if (isForCart) {
          coffeeList = coffeeList
              .where(
                  (element) => provider.coffeesAddedInCart.contains(element.id))
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
        if (coffeeList.isEmpty && provider.isCoffeeDataLoaded) {
          return Center(
            child: Column(
              children: [
                Icon(
                  isForCart
                      ? Icons.no_encryption
                      : isForFavorite
                          ? Icons.favorite
                          : Icons.coffee_rounded,
                  size: 75,
                  color: ThemeColors.brownColor.withOpacity(0.2),
                ),
                const Text("Sorry, Coffee not found!"),
              ],
            ).padYTop(50),
          );
        }
        if (!provider.isCoffeeDataLoaded) {
          return Center(
            child: CupertinoActivityIndicator(
              color: ThemeColors.brownColor,
              radius: 18,
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
            CoffeeModel currentCoffee = coffeeList[index];

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
                  price: currentCoffee.price,
                  rating: currentCoffee.rating.toDouble(),
                  image: currentCoffee.image,
                  coffeeId: currentCoffee.id,
                )).padXRight(16).padYBottom(16);
          },
        );
      },
    );
  }
}
