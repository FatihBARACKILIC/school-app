// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:school_app/db/register_db_helper.dart';
import 'package:school_app/helper/shared_preferences.dart';
import 'package:school_app/screens/sign_up/sign_up_screen.dart';
import 'package:school_app/screens/user_main/user_main_screen.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controllerEmail.text = "Ali@gmail.com";
    _controllerPassword.text = "Ali123456";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * .15,
                ),
                width: MediaQuery.of(context).size.width * .5,
                child: Image.asset(
                  "./assets/images/meb_logo.png",
                  color: Colors.white,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "Login",
                  textScaleFactor: 5,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * .075,
                  8,
                  MediaQuery.of(context).size.width * .075,
                  0,
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: _controllerEmail,
                  decoration: const InputDecoration(
                    label: Text("E-Mail"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * .075,
                  8,
                  MediaQuery.of(context).size.width * .075,
                  0,
                ),
                child: TextField(
                  controller: _controllerPassword,
                  onSubmitted: (String text) => _clickHandler(),
                  textInputAction: TextInputAction.go,
                  obscureText: true,
                  decoration: const InputDecoration(
                    label: Text("Password"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * .075,
                  8,
                  MediaQuery.of(context).size.width * .075,
                  0,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _clickHandler,
                    child: const Text("Login"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * .075,
                  8,
                  MediaQuery.of(context).size.width * .075,
                  0,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        )),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.green.shade800),
                    ),
                    child: const Text("Sign Up"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _clickHandler() async {
    String userEmail = _controllerEmail.text.trim();
    String userPassword = _controllerPassword.text.trim();

    if (userEmail.isEmpty || userPassword.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackBar("Please fill in empty areas."));
    } else {
      RegisterDbHelper registerDbHelper = RegisterDbHelper();
      int id = await registerDbHelper.getUserId(userEmail, userPassword);
      if (id == 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackBar("Wrong e-mail or password!"));
      } else {
        SharedPreferencesHelper.saveUserData("id", id);
        nextPage();
      }
    }
  }

  nextPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const UserMainScreen(),
      ),
    );
  }

  SnackBar snackBar(waring) {
    return SnackBar(
      content: Text(
        waring,
        style: const TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    );
  }
}
