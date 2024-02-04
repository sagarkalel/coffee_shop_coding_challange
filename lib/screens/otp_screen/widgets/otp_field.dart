import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpField extends StatelessWidget {
  const OtpField({super.key, required this.otpController});
  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      autoFocus: true,
      controller: otpController,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      cursorColor: ThemeColors.brownColor,
      hintCharacter: '﹡',
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        activeColor: ThemeColors.brownColor,
        inactiveColor: ThemeColors.greyColor,
        selectedColor: ThemeColors.brownColor,
        borderRadius: BorderRadius.circular(12),
        activeFillColor: ThemeColors.primaryWhite,
        inactiveFillColor: ThemeColors.primaryWhite,
        selectedFillColor: ThemeColors.primaryWhite,
      ),
    );
  }
}
