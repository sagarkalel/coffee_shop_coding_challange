import 'package:firebase_core/firebase_core.dart';
import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/screens/add_coffee_screen/add_coffee_screen.dart';
import 'package:first_challange_coffee_shop/screens/dashboard_screen/dashboard_screen.dart';
import 'package:first_challange_coffee_shop/screens/home_screen/home_screen.dart';
import 'package:first_challange_coffee_shop/screens/phone_input_screen/phone_input_screen.dart';
import 'package:first_challange_coffee_shop/screens/profile_screen/profile_screen.dart';
import 'package:first_challange_coffee_shop/utils/themes/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen/splash_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyBqsbowJ5DT6eBb4zbMhpDEs5g5Qd8OdgE",
    appId: "1:191122015582:android:a197d0b0d11270226fbbcf",
    messagingSenderId: "191122015582",
    projectId: "coffee-shop-3133f",
  ));

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MyProvider())],
      child: const MyApp()));
}

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
        '/addCoffeeScreen': (_) => const AddCoffeeScreen(),
        '/homeScreen': (_) => const HomeScreen(),
        '/profileScreen': (_) => const ProfileScreen(),
        '/phoneInputScreen': (_) => const PhoneInputScreen(),
      },
      home: const SplashScreen(),
    );
  }
}

/*

####### IMPORTANT #######

PLEASE USE FOLLOWING AUTH CREDENSIAL FOR TESTING

PHONE NUMBER: 

## account is already created
+11111111111

## account can create
+11234567890
+912222222222
+918605558038

PASSWORD 
## NOTE: same password for all numbers
123456

*/
