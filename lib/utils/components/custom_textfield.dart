import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      this.maxLines});
  final TextEditingController controller;
  final String hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter a value, it can't be empty!";
        }
        return null;
      },
    );
  }
}
