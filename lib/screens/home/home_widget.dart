// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:school_app/colors/colors.dart';
import 'package:school_app/widgets/pill_button.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    super.initState();
    setColor();
  }

  Future<void> setColor() async {
    try {
      await FlutterStatusbarcolor.setStatusBarColor(darkColor);
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        if (orientation == Orientation.portrait) {
          return _portraitMode(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
          );
        } else {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
          return _landscapeMode(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
          );
        }
      },
    );
  }

  Widget _portraitMode(double width, double height) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: const Color(0xffffffff).withOpacity(0),
          backgroundColor: darkColor,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.zero,
                width: width * .5,
                child: Image.asset(
                  fit: BoxFit.contain,
                  "assets/images/meb_logo.png",
                  color: Colors.white,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "School App",
                  style: TextStyle(
                    fontSize: 60,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 150,
                ),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 100),
                  width: width * .95,
                  height: height * .4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(width * .1),
                      topRight: Radius.circular(width * .1),
                    ),
                    color: const Color(0xFFFFFFFF),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: PillButton(
                          text: "Login",
                          textSize: 30,
                          onPressedFunction: _loginHandler,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: PillButton(
                          text: "Sign Up",
                          textSize: 30,
                          backgroundColor: darkColor,
                          onPressedFunction: _signUpHandler,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _landscapeMode(double width, double height) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      width: width * .25,
                      child: Image.asset(
                        fit: BoxFit.contain,
                        "assets/images/meb_logo.png",
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "School App",
                        style: TextStyle(
                          fontSize: 45,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  width: width * .5,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(height * .1),
                      bottomLeft: Radius.circular(height * .1),
                    ),
                    color: const Color(0xFFFFFFFF),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: PillButton(
                          text: "Login",
                          textSize: 30,
                          onPressedFunction: _loginHandler,
                          width: width * .3,
                          height: width * .1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: PillButton(
                          text: "Sign Up",
                          textSize: 30,
                          backgroundColor: darkColor,
                          onPressedFunction: _signUpHandler,
                          width: width * .3,
                          height: width * .1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loginHandler() {
    // TODO: login Screen
  }

  void _signUpHandler() {
    // TODO: Sign up screen
  }
}
