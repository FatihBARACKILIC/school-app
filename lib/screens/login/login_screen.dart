import 'package:flutter/material.dart';
import 'package:school_app/screens/login/login_widget.dart';
import 'package:school_app/theme/main_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sign Up",
      debugShowCheckedModeBanner: false,
      theme: mainTheme(),
      home: const LoginWidget(),
    );
  }
}
