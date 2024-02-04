import 'package:first_challange_coffee_shop/screens/dashboard_screen/widgets/dashboard_appbar.dart';
import 'package:first_challange_coffee_shop/screens/home_screen/widgets/coffee_tiles_gridview.dart';
import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
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
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80), child: DashboardAppbar()),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Favorite Coffees:",
                style: Styles.titleLarge(context).weight(FontWeight.w600),
              ).padXX(30),
              const Divider().padXX(30).padYY(10),
              const CoffeeTileGridview(
                isForFavorite: true,
              ),
            ],
          )).padYY(16),
    );
  }
}
