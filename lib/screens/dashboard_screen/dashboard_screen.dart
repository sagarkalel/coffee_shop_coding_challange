import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/screens/cart_screen/cart_screen.dart';
import 'package:first_challange_coffee_shop/screens/dashboard_screen/widgets/bottom_navigation.dart';
import 'package:first_challange_coffee_shop/screens/favorite_screen/favorite_screen.dart';
import 'package:first_challange_coffee_shop/screens/home_screen/home_screen.dart';
import 'package:first_challange_coffee_shop/screens/notification_screen/notification_screen.dart';
import 'package:first_challange_coffee_shop/utils/components/dialogs.dart';
import 'package:first_challange_coffee_shop/utils/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    ApiServices.getLoaction();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      bool status = await Permission.location.isGranted;
      debugPrint("location permission status 1: $status");
      if (!status && mounted) {
        Dialogs.permissionNeededAlert(
          context,
          onSelectOk: () async {
            bool value = await ApiServices.getLoaction();
            bool status = await Permission.location.isPermanentlyDenied;
            if ((value || status) && mounted) Navigator.pop(context);
            if (status && mounted) {
              Dialogs.permissionDenied(
                context,
                onSelectSetting: () {
                  openAppSettings();
                  Navigator.pop(context);
                },
              );
            }
          },
        );
      }
      ApiServices.getUserDoc();
      ApiServices.getAllCoffees();
      ApiServices.getOffers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      body: Consumer<MyProvider>(
        builder: (context, provider, child) => provider.currentNavBar == 0
            ? const HomeScreen()
            : provider.currentNavBar == 1
                ? const FavoriteScreen()
                : provider.currentNavBar == 2
                    ? const CartScreen()
                    : const NotificationScreen(),
      ),
    );
  }
}
