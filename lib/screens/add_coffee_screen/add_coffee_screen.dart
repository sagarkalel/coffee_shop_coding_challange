import 'package:first_challange_coffee_shop/screens/phone_input_screen/widgets/my_Form_field.dart';
import 'package:first_challange_coffee_shop/utils/components/snackbar.dart';
import 'package:first_challange_coffee_shop/utils/constatnts/sizes.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/services/api_services.dart';
import 'package:flutter/material.dart';

class AddCoffeeScreen extends StatefulWidget {
  const AddCoffeeScreen({super.key});

  @override
  State<AddCoffeeScreen> createState() => _AddCoffeeScreenState();
}

class _AddCoffeeScreenState extends State<AddCoffeeScreen> {
  final TextEditingController typeController = TextEditingController();
  final TextEditingController mixedWithController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  // final TextEditingController bannerController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Coffee here"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          save();
        },
        label: Row(
          children: [
            const Text("Add coffee data"),
            xGap(16),
            const Icon(Icons.done)
          ],
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyFormField(
                controller: typeController,
                labelText: "Coffee type",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter coffee type";
                  }
                  return null;
                },
              ),
              MyFormField(
                controller: mixedWithController,
                labelText: "Mixed with",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter mixed with";
                  }
                  return null;
                },
              ),
              MyFormField(
                controller: priceController,
                labelText: "Price",
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter price";
                  }
                  return null;
                },
              ),
              MyFormField(
                controller: ratingController,
                labelText: "Rating",
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter rating";
                  }
                  return null;
                },
              ),
              // MyFormField(
              //   controller: bannerController,
              //   labelText: "for banner",
              //   keyboardType: TextInputType.number,
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return "Please enter isForBanner as 1 or 2";
              //     } else if (value != '1' && value != '0') {
              //       return "enter value digitally, 1 or 0";
              //     }
              //     return null;
              //   },
              // ),
              // MyFormfield(
              //   controller: priceController,
              //   labelText: "is recently searched",
              //   keyboardType: TextInputType.number,
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return "Please enter isForBanner as 1 or 2";
              //     } else if (value != '1' || value != '0') {
              //       return "enter value digitally, 1 or 0";
              //     }
              //     return null;
              //   },
              // ),
              MyFormField(
                controller: descController,
                labelText: "Decsription",
                maxLines: 5,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter description";
                  }
                  return null;
                },
              ),
            ],
          ).padXX(30).padYY(30).padYBottom(Sizes.bottomInsectHeight(context)),
        ),
      ),
    );
  }

  Future<void> save() async {
    if (formKey.currentState!.validate()) {
      debugPrint("all imformation is valid");

      final result = await saveData();
      if (mounted && result.isNotEmpty) {
        Navigator.pop(context);
      } else if (mounted) {
        showSnackbar(context, text: "something went wrong, document not added");
      }
    }
  }

  Future<String> saveData() async {
    Map<String, dynamic> data = {
      'coffee_type': typeController.text,
      'mixed_with': mixedWithController.text,
      'desc': descController.text,
      // 'isForBanner': int.parse(bannerController.text),
      'price': double.parse(priceController.text),
      'rating': double.parse(ratingController.text),
    };
    return await ApiServices.addCoffee(context, data: data);
  }
}
