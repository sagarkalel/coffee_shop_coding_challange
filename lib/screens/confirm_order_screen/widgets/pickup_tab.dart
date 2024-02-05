import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:flutter/material.dart';

class PickupTab extends StatelessWidget {
  const PickupTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.timer,
            size: 50,
            color: ThemeColors.brownColor.withOpacity(0.3),
          ),
          const Text("This part has not implemented yet!"),
        ],
      ),
    );
  }
}
