import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';

class AddressBottomsheet extends StatelessWidget {
  const AddressBottomsheet({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Styles.titleMedium(context).weight(FontWeight.w600),
        ),
        yGap(8),
        const Divider(),
        yGap(30),
        Icon(Icons.timer_off_outlined,
            size: 75, color: ThemeColors.brownColor.withOpacity(0.5)),
        Text(
          "Didn't get enough time, please will do later",
          style: Styles.titleMedium(context),
        ),
        yGap(30),
        ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("It's okay, best of luck!"),
                xGap(8),
                const Icon(Icons.done_all)
              ],
            )),
      ],
    ).padXX(30);
  }
}
