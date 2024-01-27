import 'package:first_challange_coffee_shop/screens/cart_screen/cart_screen.dart';
import 'package:first_challange_coffee_shop/screens/colors_screen/colors_screen.dart';
import 'package:first_challange_coffee_shop/screens/dashboard_screen/dashboard_screen.dart';
import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/screens/favorite_screen/favorite_screen.dart';
import 'package:first_challange_coffee_shop/screens/home_screen/home_screen.dart';
import 'package:first_challange_coffee_shop/screens/notification_screen/notification_screen.dart';
import 'package:first_challange_coffee_shop/screens/profile_screen/profile_screen.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen/splash_screen.dart';

void main(List<String> args) {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MyProvider())],
      child: const MyApp()));
}

// ColorScheme kColorScheme =
//     ColorScheme.fromSeed(seedColor: const Color(0xffC67C4E));
// ColorScheme kDarkColorScheme =
//     ColorScheme.fromSeed(seedColor: Colors.deepPurple);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        useMaterial3: true,
        scaffoldBackgroundColor: ThemeColors.scaffoldBackgroundColor,
      ),
      routes: {
        '/dashboardScreen': (_) => const DashboardScreen(),
        '/colorsScreen': (_) => const ColorsScreen(),
        '/homeScreen': (_) => const HomeScreen(),
        '/favoriteScreen': (_) => const FavoriteScreen(),
        '/cartScreen': (_) => const CartScreen(),
        '/notificationScreen': (_) => const NotificationScreen(),
        '/profileScreen': (_) => const ProfileScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
