import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:school_app/colors/colors.dart';
import 'package:school_app/helper/shared_preferences.dart';
import 'package:school_app/screens/login/login_screen.dart';
import 'package:school_app/screens/sign_up/sign_up_screen.dart';
import 'package:school_app/screens/user_main/user_main_screen.dart';
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
    idCheck();
    setColor();
  }

  Future<int> getId() async =>
      await SharedPreferencesHelper.getUserData("id") ?? 0;

  idCheck() async {
    var id = await getId();

    if (id != 0) {
      userMainRoute();
    }
  }

  userMainRoute() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const UserMainScreen(),
        ),
      );
    });
  }

  Future<void> setColor() async {
    try {
      await FlutterStatusbarcolor.setStatusBarColor(darkColor);
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color(0xffffffff).withOpacity(0),
        backgroundColor: darkColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    width: MediaQuery.of(context).size.width * .5,
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
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 150,
                ),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 100),
                  width: MediaQuery.of(context).size.width * .95,
                  height: MediaQuery.of(context).size.height * .4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                          MediaQuery.of(context).size.width * .1),
                      topRight: Radius.circular(
                          MediaQuery.of(context).size.width * .1),
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
            ),
          ],
        ),
      ),
    );
  }

  void _loginHandler() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void _signUpHandler() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      ),
    );
  }
}
