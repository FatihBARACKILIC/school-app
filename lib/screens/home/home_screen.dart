import 'package:flutter/material.dart';
import 'package:school_app/theme/main_theme.dart';

Color darkColor = const Color.fromRGBO(22, 27, 34, 1);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "School App",
      debugShowCheckedModeBanner: false,
      theme: mainTheme(),
      home: MediaQuery.of(context).size.height > 1440
          ? _content(context: context)
          : _content(context: context, divide: .5),
    );
  }

  Widget _content({required BuildContext context, num divide = 1}) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.zero,
              width: MediaQuery.of(context).size.width * .5,
              child: Image.asset(
                fit: BoxFit.contain,
                "assets/images/meb_logo.png",
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "School App",
                style: TextStyle(
                  fontSize:
                      (Theme.of(context).textTheme.displayLarge?.fontSize ??
                              50) *
                          divide,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: (150.0 * divide),
              ),
              child: Container(
                padding: const EdgeInsets.only(bottom: 100),
                width: MediaQuery.of(context).size.width * .95,
                height: MediaQuery.of(context).size.height * .4,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Color(0xFFFFFFFF),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .5,
                        height: MediaQuery.of(context).size.height * .075,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.deepPurple,
                            ),
                            shape: MaterialStatePropertyAll<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(1000),
                                ),
                              ),
                            ),
                          ),
                          child: Text(
                            "Login",
                            textScaleFactor: (2.5 * divide),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .5,
                        height: MediaQuery.of(context).size.height * .075,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            side: MaterialStatePropertyAll(
                              BorderSide(
                                color: Colors.deepPurple,
                                width: (5.0 * divide),
                              ),
                            ),
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(darkColor),
                            shape:
                                const MaterialStatePropertyAll<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(1000),
                                ),
                              ),
                            ),
                          ),
                          child: Text(
                            "SignUp",
                            textScaleFactor: (2.5 * divide),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
