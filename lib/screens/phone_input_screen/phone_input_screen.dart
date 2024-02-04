import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/screens/phone_input_screen/widgets/phone_input_field.dart';
import 'package:first_challange_coffee_shop/utils/components/snackbar.dart';
import 'package:first_challange_coffee_shop/utils/constatnts/sizes.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/services/api_services.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneInputScreen extends StatelessWidget {
  const PhoneInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    FocusNode focusNode = FocusNode();
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => focusNode.unfocus(),
        child: Scaffold(
          body: Consumer<MyProvider>(
            builder: (context, provider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Please enter your phone number including country code",
                    textAlign: TextAlign.center,
                    style: Styles.titleLarge(context),
                  ),
                  yGap(30),
                  PhoneInputField(
                    controller: controller,
                    hintText: "+911111111111",
                    focusNode: focusNode,
                    icon: Icons.phone,
                    textInputType: TextInputType.phone,
                    onchange: (p0) =>
                        p0.length >= 13 ? focusNode.unfocus() : null,
                  ),
                  yGap(30),
                  SizedBox(
                    width: Sizes.screenX(context) / 2,
                    child: ElevatedButton(
                      onPressed: provider.isLoading
                          ? () {}
                          : () {
                              focusNode.unfocus();
                              if (controller.text.length < 13) {
                                showSnackbar(context,
                                    text:
                                        "Please enter mobile number with country code, e.g +911111111111");
                              } else {
                                provider.isLoading = true;
                                ApiServices.sendOtp(context,
                                    input: controller.text, provider: provider);
                              }
                            },
                      child: provider.isLoading
                          ? SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                color: ThemeColors.brownColor,
                              ),
                            )
                          : const Text("Verify phone number"),
                    ),
                  ),
                ],
              );
            },
          ).padXX(30),
        ),
      ),
    );
  }
}
