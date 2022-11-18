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
      home: _home(context),
    );
  }

  Widget _home(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 1440) {
            return _wideContent(context);
          } else if (constraints.maxWidth > 600) {
            return _bigContent(context);
          } else {
            return _normalContent(context);
          }
        },
      ),
    );
  }

  Widget _wideContent(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.zero,
              width: MediaQuery.of(context).size.width * .1,
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
                      Theme.of(context).textTheme.headline2?.fontSize ?? 50,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .25,
                height: MediaQuery.of(context).size.height * .075,
                child: ElevatedButton(
                  onPressed: () {
                    _loginHandler(MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height);
                  },
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
                  child: const Text(
                    "Login",
                    textScaleFactor: 2.5,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .25,
                height: MediaQuery.of(context).size.height * .075,
                child: ElevatedButton(
                  onPressed: () {
                    _signUpHandler(MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height);
                  },
                  style: ButtonStyle(
                    side: const MaterialStatePropertyAll(
                      BorderSide(
                        color: Colors.deepPurple,
                        width: 5,
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll<Color>(darkColor),
                    shape: const MaterialStatePropertyAll<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(1000),
                        ),
                      ),
                    ),
                  ),
                  child: const Text(
                    "SignUp",
                    textScaleFactor: 2.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bigContent(BuildContext context) {
    return SafeArea(
      child: Center(
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
                      ((Theme.of(context).textTheme.headline1?.fontSize ?? 50) *
                          1.25),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 150,
              ),
              child: Container(
                padding: const EdgeInsets.only(bottom: 100),
                width: MediaQuery.of(context).size.width * .95,
                height: MediaQuery.of(context).size.height * .4,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(150),
                    topRight: Radius.circular(150),
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
                          onPressed: () {
                            _loginHandler(MediaQuery.of(context).size.width,
                                MediaQuery.of(context).size.height);
                          },
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
                          child: const Text(
                            "Login",
                            textScaleFactor: 4,
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
                          onPressed: () {
                            _signUpHandler(MediaQuery.of(context).size.width,
                                MediaQuery.of(context).size.height);
                          },
                          style: ButtonStyle(
                            side: const MaterialStatePropertyAll(
                              BorderSide(
                                color: Colors.deepPurple,
                                width: 5,
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
                          child: const Text(
                            "SignUp",
                            textScaleFactor: 4,
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

  Widget _normalContent(BuildContext context) {
    return SafeArea(
      child: Center(
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
                  fontSize: Theme.of(context).textTheme.headline3?.fontSize,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .075,
              ),
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * .075,
                ),
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
                          onPressed: () {
                            _loginHandler(MediaQuery.of(context).size.width,
                                MediaQuery.of(context).size.height);
                          },
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
                          child: const Text(
                            "Login",
                            textScaleFactor: 1.75,
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
                          onPressed: () {
                            _signUpHandler(MediaQuery.of(context).size.width,
                                MediaQuery.of(context).size.height);
                          },
                          style: ButtonStyle(
                            side: const MaterialStatePropertyAll(
                              BorderSide(
                                color: Colors.deepPurple,
                                width: 1.5,
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
                          child: const Text(
                            "SignUp",
                            textScaleFactor: 1.75,
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

  void _loginHandler(double width, double height) {
    print("width: $width");
    print("height: $height");
  }

  void _signUpHandler(double width, double height) {
    print("width: $width");
    print("height: $height");
  }
}
