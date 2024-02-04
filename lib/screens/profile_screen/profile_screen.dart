import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint(
        "this is _mylocality value of persisted sate: ${MyProvider().myLocality}");
    return Scaffold(
      appBar: AppBar(title: const Text("profile screen")),
    );
  }
}
