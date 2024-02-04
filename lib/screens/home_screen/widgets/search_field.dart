import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/utils/constatnts/asset_constants.dart';
import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.hintText,
    required this.focusNode,
    required this.onTap,
  });
  final String hintText;
  final FocusNode focusNode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    MyProvider provieder = MyProvider();
    return Container(
      height: 52,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: ThemeColors.primaryWhite,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ThemeColors.hintText)),
      child: Row(
        children: [
          if (!focusNode.hasFocus)
            SvgPicture.asset(
              Assets.searchIcon,
              color: ThemeColors.brownColor,
            ).padXX(16),
          if (focusNode.hasFocus)
            Icon(
              Icons.arrow_back_rounded,
              color: ThemeColors.brownColor,
            ).padXX(16),
          Expanded(
            child: TextFormField(
              controller: provieder.searchController,
              focusNode: focusNode,
              onTap: onTap,
              onChanged: (value) => provieder.setSearchText = value,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle:
                    Styles.bodyLarge(context).textColor(ThemeColors.hintText),
              ),
              style: Styles.bodyLarge(context),
            ),
          ),
          Container(
            height: 44,
            width: 44,
            margin: const EdgeInsets.all(4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: ThemeColors.brownColor,
                borderRadius: BorderRadius.circular(12)),
            child: SvgPicture.asset(Assets.refineIcon),
          )
        ],
      ),
    );
  }
}
