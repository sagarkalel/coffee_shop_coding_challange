import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static Future<void> permissionDenied(BuildContext context,
      {required VoidCallback onSelectSetting}) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Location permission denied",
            style: Styles.titleLarge(context),
          ),
          content: const Text(
              "You have denied the location permission. Please enable it from the 'Settings' section of your phone."),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("cancel")),
            TextButton(
                onPressed: onSelectSetting,
                child: const Text("Go to settings")),
          ],
        );
      },
    );
  }

  static Future<void> permissionNeededAlert(BuildContext context,
      {required VoidCallback onSelectOk}) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Column(
            children: [
              const Icon(Icons.location_off_outlined, size: 50),
              Text(
                "Location permission not enabled",
                style: Styles.titleLarge(context),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: const Text(
            "Please enable location permission for better delivery experience.",
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  // Navigator.pop(context);
                },
                child: Text(
                  "Select location manually",
                  style: Styles.titleSmall(context)
                      .textColor(ThemeColors.secondary(context)),
                )),
            TextButton(
                onPressed: onSelectOk,
                child: Text(
                  "Enable device location",
                  style: Styles.titleSmall(context)
                      .textColor(ThemeColors.primary(context)),
                )),
          ],
        );
      },
    );
  }
}
