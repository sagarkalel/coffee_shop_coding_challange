import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/screens/phone_input_screen/widgets/phone_input_field.dart';
import 'package:first_challange_coffee_shop/utils/components/snackbar.dart';
import 'package:first_challange_coffee_shop/utils/constatnts/routes_constants.dart';
import 'package:first_challange_coffee_shop/utils/constatnts/sizes.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/services/api_services.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final FocusNode focusNode = FocusNode();
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop) {
          Navigator.pushNamed(context, AppRoutes.phoneInputScreen);
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ThemeColors.scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
            title: IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.phoneInputScreen),
                icon: Icon(
                  Icons.arrow_back,
                  color: ThemeColors.brownColor,
                  size: 30,
                )),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Please enter your Name.",
                textAlign: TextAlign.center,
                style: Styles.titleLarge(context),
              ),
              yGap(30),
              PhoneInputField(
                controller: nameController,
                hintText: "John Cena",
                focusNode: focusNode,
                icon: Icons.person,
                textInputType: TextInputType.text,
              ),
              yGap(30),
              Consumer<MyProvider>(
                builder: (context, provider, child) {
                  return SizedBox(
                    width: Sizes.screenX(context) / 2,
                    child: ElevatedButton(
                        onPressed: provider.isLoading
                            ? () {}
                            : () {
                                if (nameController.text.length < 3) {
                                  showSnackbar(context,
                                      text: "Please enter valid name");
                                } else {
                                  ApiServices.createUserAccount(context,
                                      name: nameController.text,
                                      provider: provider);
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
                            : const Text("Let's get started")),
                  );
                },
              ),
            ],
          ).padXX(30),
        ),
      ),
    );
  }
}
