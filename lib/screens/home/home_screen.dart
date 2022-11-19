import 'package:flutter/material.dart';
import 'package:school_app/screens/home/home_widget.dart';
import 'package:school_app/theme/main_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "School App",
      debugShowCheckedModeBanner: false,
      theme: mainTheme(),
      home: const HomeWidget(),
    );
  }
}
