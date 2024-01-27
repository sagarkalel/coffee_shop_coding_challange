import 'package:flutter/material.dart';

class ThemeColors {
  static Color primary(context) => Theme.of(context).colorScheme.primary;
  static Color secondary(context) => Theme.of(context).colorScheme.secondary;
  static Color tertiry(context) => Theme.of(context).colorScheme.tertiary;

  static Color onPrimary(context) => Theme.of(context).colorScheme.onPrimary;
  static Color onSecondary(context) =>
      Theme.of(context).colorScheme.onSecondary;
  static Color onTertiary(context) => Theme.of(context).colorScheme.onTertiary;

  static Color primaryContainer(context) =>
      Theme.of(context).colorScheme.primaryContainer;
  static Color secondaryContainer(context) =>
      Theme.of(context).colorScheme.secondaryContainer;
  static Color tertiaryContainer(context) =>
      Theme.of(context).colorScheme.tertiaryContainer;

  static Color onPrimaryContainer(context) =>
      Theme.of(context).colorScheme.onPrimaryContainer;
  static Color onSecondaryContainer(context) =>
      Theme.of(context).colorScheme.onSecondaryContainer;
  static Color onTertiaryContainer(context) =>
      Theme.of(context).colorScheme.onTertiaryContainer;

  static Color inversePrimary(context) =>
      Theme.of(context).colorScheme.inversePrimary;
  static Color onError(context) => Theme.of(context).colorScheme.onError;
  static Color inverseSurface(context) =>
      Theme.of(context).colorScheme.inverseSurface;
  static Color error(context) => Theme.of(context).colorScheme.error;
  static Color errorContainer(context) =>
      Theme.of(context).colorScheme.errorContainer;
  static Color onErrorContainer(context) =>
      Theme.of(context).colorScheme.onErrorContainer;
  static Color onInverseSurface(context) =>
      Theme.of(context).colorScheme.onInverseSurface;
  static Color shadow(context) => Theme.of(context).colorScheme.shadow;
  static Color hintColor(context) => Theme.of(context).hintColor;
  static Color inActive(context) => const Color(0xff8D8D8D);

  static Color get brownColor => const Color(0xffC67C4E);
  static Color get primaryBlack => const Color(0xff131313);
  static Color get secondaryBlack => const Color(0xff313131);
  static Color get primaryText => const Color(0xffDDDDDD);
  static Color get secondaryText => const Color(0xffB7B7B7);
  static Color get hintText => const Color(0xff989898);
  static Color get darkSecondaryText => const Color(0xff2F4B4E);
  static Color get greyColor => Colors.grey;
  static Color get primanyWhite => Colors.white;
  static Color get secondaryWhite => Colors.white70;
  static Color get scaffoldBackgroundColor => const Color(0xffF9F9F9);
  static Color get amberColor => const Color(0xffFBBE21);
  // static Color primary(context) => Theme.of(context).colorScheme.tertiary;
}
