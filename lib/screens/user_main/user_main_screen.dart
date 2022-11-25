import 'package:flutter/material.dart';
import 'package:school_app/screens/user_main/user_main_widget.dart';
import 'package:school_app/theme/main_theme.dart';

class UserMainScreen extends StatelessWidget {
  const UserMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sign Up",
      debugShowCheckedModeBanner: false,
      theme: mainTheme(),
      home: const UserMainWidget(),
    );
  }
}
