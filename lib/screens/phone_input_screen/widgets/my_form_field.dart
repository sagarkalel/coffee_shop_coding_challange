import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  const MyFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.labelText,
    this.keyboardType,
    this.maxLines,
  });
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String labelText;
  final TextInputType? keyboardType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        labelText: labelText,
        labelStyle: Styles.bodyLarge(context).textColor(ThemeColors.hintText),
        border: const OutlineInputBorder(),
      ),
    ).padYBottom(16);
  }
}
