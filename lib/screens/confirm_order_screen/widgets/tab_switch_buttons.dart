import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';

class TabSwitchButtons extends StatelessWidget {
  const TabSwitchButtons(
      {super.key, required this.tabController, required this.setState});
  final TabController tabController;
  final VoidCallback setState;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: ThemeColors.hintText.withOpacity(0.2),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: tabController.index == 0
                  ? null
                  : () {
                      tabController.animateTo(0);
                      setState.call();
                    },
              child: Container(
                height: 40,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: tabController.index == 0
                      ? ThemeColors.brownColor
                      : Colors.transparent,
                ),
                child: Text(
                  'Deliver',
                  style: Styles.titleLarge(context)
                      .textColor(
                        tabController.index == 0
                            ? ThemeColors.primaryWhite
                            : ThemeColors.primaryBlack,
                      )
                      .weight(tabController.index == 0
                          ? FontWeight.w600
                          : FontWeight.w400),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: tabController.index == 1
                  ? null
                  : () {
                      tabController.animateTo(1);
                      setState.call();
                    },
              child: Container(
                height: 40,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: tabController.index == 1
                      ? ThemeColors.brownColor
                      : Colors.transparent,
                ),
                child: Text(
                  'Pick Up',
                  style: Styles.titleLarge(context)
                      .textColor(tabController.index == 1
                          ? ThemeColors.primaryWhite
                          : ThemeColors.primaryBlack)
                      .weight(tabController.index == 1
                          ? FontWeight.w600
                          : FontWeight.w400),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
