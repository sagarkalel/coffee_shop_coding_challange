import 'package:first_challange_coffee_shop/models/address_model.dart';
import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/screens/confirm_order_screen/widgets/add_note_bottomsheet.dart';
import 'package:first_challange_coffee_shop/screens/confirm_order_screen/widgets/address_bottomsheet.dart';
import 'package:first_challange_coffee_shop/utils/constatnts/sizes.dart';
import 'package:first_challange_coffee_shop/utils/extensions/textstyle_extensions.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:first_challange_coffee_shop/utils/themes/textstyles_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class AddressBar extends StatelessWidget {
  const AddressBar({super.key, required this.coffeeId});
  final String coffeeId;

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, child) {
        Address usedAddress =
            Address(landmark: '', house: '', id: '', locality: '');
        if (provider.addresses.isNotEmpty) {
          usedAddress = provider.addresses
              .where((element) => element.id == provider.inUsedAddress)
              .toList()
              .first;
        }
        String detailedAddress = '';

        detailedAddress = '${usedAddress.locality}, ${usedAddress.landmark}';
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivery Address",
              style: Styles.titleMedium(context).weight(FontWeight.w600),
            ),
            yGap(10),
            Text(
              provider.myLocality,
              style: Styles.titleMedium(context),
            ),
            Text(
              detailedAddress,
              style: Styles.titleSmall(context).textColor(ThemeColors.hintText),
            ),
            yGap(10),
            Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    showModalBottomSheet(
                      showDragHandle: true,
                      isScrollControlled: true,
                      constraints: BoxConstraints(
                          maxHeight: Sizes.screenY(context) * .75),
                      context: context,
                      builder: (context) {
                        return const AddressBottomsheet(
                            title: "Your current Address");
                      },
                    );
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: ThemeColors.greyColor)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FadeInImage(
                          placeholder: MemoryImage(kTransparentImage),
                          image: const AssetImage("assets/icons/edit.png"),
                          height: 14,
                          width: 14,
                        ),
                        const Text('  Edit Address'),
                      ],
                    ),
                  ),
                ),
                xGap(8),
                InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    showModalBottomSheet(
                      showDragHandle: true,
                      isScrollControlled: true,
                      constraints: BoxConstraints(
                          maxHeight: Sizes.screenY(context) * .75),
                      context: context,
                      builder: (context) {
                        return AddNoteBottomsheet(coffeeId: coffeeId);
                      },
                    );
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: ThemeColors.greyColor)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FadeInImage(
                          placeholder: MemoryImage(kTransparentImage),
                          image: const AssetImage("assets/icons/note.png"),
                          height: 14,
                          width: 14,
                        ),
                        Text(provider.getNotesForGivenId(coffeeId).isNotEmpty
                            ? '  Change Note'
                            : '  Add Note'),
                      ],
                    ),
                  ),
                )
              ],
            ),
            if (provider.getNotesForGivenId(coffeeId).isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  yGap(8),
                  Text(
                    'Note',
                    style: Styles.titleMedium(context),
                  ),
                  Text(
                    provider.getNotesForGivenId(coffeeId),
                    style: Styles.bodyMedium(context)
                        .textColor(ThemeColors.hintText),
                    maxLines: 3,
                  ),
                ],
              ),
            yGap(8),
            const Divider(),
          ],
        );
      },
    );
  }
}
