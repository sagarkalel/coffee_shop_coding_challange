import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';

class PhoneInputField extends StatelessWidget {
  const PhoneInputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.focusNode,
    required this.icon,
    required this.textInputType,
    this.maxLength,
    this.onchange,
  });
  final TextEditingController controller;
  final String hintText;
  final FocusNode focusNode;
  final IconData icon;
  final TextInputType textInputType;
  final int? maxLength;
  final Function(String)? onchange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        autofocus: true,
        maxLength: maxLength ?? 13,
        onChanged: onchange,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            hintText: hintText,
            hintStyle:
                Styles.bodyLarge(context).textColor(ThemeColors.hintText),
            counterText: '',
            prefixIcon: Icon(
              icon,
              color: ThemeColors.brownColor,
            )),
        keyboardType: textInputType,
      ),
    );
  }
}
