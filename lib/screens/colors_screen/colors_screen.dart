import 'package:flutter/material.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("kColorScheme.onBackground"),
      ),
    );
  }

  Widget item({required String text, required Color color}) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: 100,
        width: double.infinity,
        color: color,
        alignment: Alignment.center,
        child: Text(text),
      );
}
