import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/utils/constatnts/routes_constants.dart';
import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardAppbar extends StatefulWidget {
  const DashboardAppbar({super.key});

  @override
  State<DashboardAppbar> createState() => _DashboardAppbarState();
}

class _DashboardAppbarState extends State<DashboardAppbar> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: ThemeColors.primaryBlack,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Location",
            style:
                Styles.bodyMedium(context).textColor(ThemeColors.secondaryText),
          ),
          Material(
            color: ThemeColors.primaryBlack,
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Consumer<MyProvider>(
                      builder: (context, value, child) => Text(
                            value.myLocality.isEmpty
                                ? "Location not enabled"
                                : value.myLocality,
                            style: Styles.labelLarge(context)
                                .textColor(ThemeColors.primaryText),
                          )),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: ThemeColors.primaryText,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      actions: [
        InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () => Navigator.pushNamed(context, AppRoutes.profileScreen),
          child: Container(
            height: 45,
            width: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: ThemeColors.secondaryWhite,
                borderRadius: BorderRadius.circular(14)),
            child: Icon(
              Icons.person_outline,
              size: 30,
              color: ThemeColors.greyColor,
            ),
          ),
        ),
        xGap(30)
      ],
    );
  }
}
