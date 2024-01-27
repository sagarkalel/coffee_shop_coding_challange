import 'package:first_challange_coffee_shop/screens/home_screen/widgets/banner_card.dart';
import 'package:first_challange_coffee_shop/screens/home_screen/widgets/coffee_tiles_gridview.dart';
import 'package:first_challange_coffee_shop/screens/home_screen/widgets/coffee_type.dart';
import 'package:first_challange_coffee_shop/screens/home_screen/widgets/search_field.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final FocusNode focusNode = FocusNode();
    return GestureDetector(
      onTap: () => focusNode.unfocus(),
      child: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 150,
              color: ThemeColors.primaryBlack,
              alignment: Alignment.topCenter,
              child: SearchField(
                controller: controller,
                focusNode: focusNode,
                hintText: "Search coffee",
              ),
            ),
            const BannerCard().padYTop(150 - 70),
            const SizedBox(height: 40, child: CoffeeType())
                .padYTop(150 + 70 + 24),
            const CoffeeTileGridview().padYTop(150 + 70 + 24 + 40 + 24)
          ],
        ),
      ),
    );
  }
}
