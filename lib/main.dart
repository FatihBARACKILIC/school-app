import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:school_app/screens/home/home_screen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initialization();

    return const MaterialApp(
      title: "School App",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }

  void initialization() async {
    FlutterNativeSplash.remove();
  }
}
