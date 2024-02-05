import 'package:first_challange_coffee_shop/data/coffee_model.dart';
import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/screens/coffee_details_screen/widgets/appbar.dart';
import 'package:first_challange_coffee_shop/screens/confirm_order_screen/widgets/deliver_tab.dart';
import 'package:first_challange_coffee_shop/screens/confirm_order_screen/widgets/order_now_bottom_nav.dart';
import 'package:first_challange_coffee_shop/screens/confirm_order_screen/widgets/pickup_tab.dart';
import 'package:first_challange_coffee_shop/screens/confirm_order_screen/widgets/tab_switch_buttons.dart';
import 'package:first_challange_coffee_shop/utils/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key, required this.coffeModel});
  final CoffeeModel coffeModel;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: MyAppbar(
            coffeeId: widget.coffeModel.id,
            title: "Order",
          )),
      bottomNavigationBar: OrderNowBottomBar(coffeeModel: widget.coffeModel),
      body: Consumer<MyProvider>(
        builder: (context, provider, child) {
          return DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: [
                  TabSwitchButtons(
                    tabController: _tabController,
                    setState: () => setState(() {}),
                  ).padXX(30),
                  Expanded(
                    child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _tabController,
                        children: [
                          DeliverTab(coffeModel: widget.coffeModel),
                          const PickupTab().padXX(30),
                        ]),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
