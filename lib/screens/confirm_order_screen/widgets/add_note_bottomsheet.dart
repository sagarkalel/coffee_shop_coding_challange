import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/utils/components/custom_textfield.dart';
import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';

class AddNoteBottomsheet extends StatefulWidget {
  const AddNoteBottomsheet({super.key, required this.coffeeId});
  final String coffeeId;

  @override
  State<AddNoteBottomsheet> createState() => _AddNoteBottomsheetState();
}

class _AddNoteBottomsheetState extends State<AddNoteBottomsheet> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Text(
            "Please add note with your order",
            style: Styles.titleMedium(context).weight(FontWeight.w600),
          ),
          yGap(8),
          const Divider(),
          yGap(8),
          CustomTextfield(
            controller: controller,
            hintText: "Please enter note here...",
            maxLines: 5,
          ),
          yGap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    MyProvider provider = MyProvider();
                    var data = {widget.coffeeId: controller.text};
                    if (formKey.currentState!.validate()) {
                      try {
                        provider.addNote(data);
                        Navigator.pop(context);
                      } catch (e) {
                        debugPrint("error whiel adding note: $e and $data");
                      }
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Add note"),
                      xGap(8),
                      const Icon(Icons.done_all)
                    ],
                  )),
            ],
          )
        ],
      ).padXX(30),
    );
  }
}
