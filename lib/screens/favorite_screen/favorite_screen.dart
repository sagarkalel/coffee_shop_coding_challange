import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/screens/home_screen/widgets/coffee_tiles_gridview.dart';
import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => MyProvider().currentNavBar = 0,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ThemeColors.scaffoldBackgroundColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => MyProvider().currentNavBar = 0,
              ),
              Text(
                "Favorite Coffees",
                style: Styles.titleLarge(context).weight(FontWeight.w600),
              ),
            ],
          ),
        ),
        body: const SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoffeeTileGridview(
                  isForFavorite: true,
                ),
              ],
            )).padYY(16),
      ),
    );
  }
}
