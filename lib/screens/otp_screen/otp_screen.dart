import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/screens/otp_screen/widgets/otp_field.dart';
import 'package:first_challange_coffee_shop/utils/components/snackbar.dart';
import 'package:first_challange_coffee_shop/utils/constatnts/sizes.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/services/api_services.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen(
      {super.key,
      required this.phoneNumber,
      required this.verificationId,
      required this.forceResendingToken});
  final String phoneNumber;
  final String verificationId;
  final int? forceResendingToken;

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if (didPop) {
          MyProvider provider = MyProvider();
          provider.canselTimer();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColors.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          title: IconButton(
              onPressed: () {
                Navigator.pop(context);
                MyProvider provider = MyProvider();
                provider.canselTimer();
              },
              icon: Icon(
                Icons.arrow_back,
                color: ThemeColors.brownColor,
                size: 30,
              )),
        ),
        body: Consumer<MyProvider>(
          builder: (context, provider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Please enter 6 digit OTP sent on ${ApiServices.phoneNumberToDisplay(phoneNumber)}",
                  textAlign: TextAlign.center,
                  style: Styles.titleLarge(context),
                ),
                yGap(30),
                OtpField(otpController: otpController),
                yGap(16),
                SizedBox(
                  height: 50,
                  child: (provider.resendTime != 0)
                      ? Text(
                          "Resend OTP in 00:${provider.resendTime.toString().padLeft(2, '0')}")
                      : (provider.resendTime == 0)
                          ? TextButton(
                              onPressed: provider.isResending
                                  ? null
                                  : () {
                                      otpController.clear();
                                      ApiServices.sendOtp(
                                        context,
                                        input: phoneNumber,
                                        provider: provider,
                                        isForResend: true,
                                      );
                                    },
                              child: provider.isResending
                                  ? SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: CircularProgressIndicator(
                                        color: ThemeColors.brownColor,
                                      ))
                                  : const Text("Resend OTP"))
                          : const SizedBox.shrink(),
                ),
                yGap(30),
                SizedBox(
                  width: Sizes.screenX(context) / 2,
                  child: ElevatedButton(
                    onPressed: provider.isLoading
                        ? () {}
                        : () {
                            if (otpController.text.length < 6) {
                              showSnackbar(context,
                                  text:
                                      "Please enter correct and 6 digin OTP.");
                            } else {
                              provider.isLoading = true;
                              ApiServices.verifyOtp(
                                context,
                                otp: otpController.text,
                                verificationId: verificationId,
                                provider: provider,
                                phoneNumber: phoneNumber,
                              );
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
                        : const Text("Verify OTP"),
                  ),
                ),
              ],
            ).padXX(30);
          },
        ),
      ),
    );
  }
}
