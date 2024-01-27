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
    required this.controller,
    required this.focusNode,
  });
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: ThemeColors.secondaryBlack,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          SvgPicture.asset(Assets.searchIcon).padXX(16),
          Expanded(
            child: TextFormField(
              controller: controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle:
                    Styles.bodyLarge(context).textColor(ThemeColors.hintText),
              ),
              style:
                  Styles.bodyLarge(context).textColor(ThemeColors.primaryText),
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
