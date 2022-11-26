// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:school_app/db/register_db_helper.dart';
import 'package:school_app/helper/shared_preferences.dart';
import 'package:school_app/model/person.dart';
import 'package:school_app/screens/login/login_screen.dart';
import 'package:school_app/screens/user_main/user_main_screen.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final RegisterDbHelper _registerDbHelper = RegisterDbHelper();

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controllerName.text = "Ali";
    _controllerEmail.text = "Ali@gmail.com";
    _controllerPassword.text = "Ali123456";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
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
                  "Sign Up",
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
                  controller: _controllerName,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text("User Name"),
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
                  child: ElevatedButton.icon(
                    onPressed: _clickHandler,
                    icon: const Icon(Icons.add),
                    label: const Text("Register"),
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
                          builder: (context) => const LoginScreen(),
                        )),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.green.shade800),
                    ),
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
                    onPressed: () {
                      RegisterDbHelper registerDbHelper = RegisterDbHelper();
                      registerDbHelper.deleteAllDB();
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.red.shade800),
                    ),
                    child: const Text("Clear"),
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
    String userName = _controllerName.text.trim();
    String userEmail = _controllerEmail.text.trim();
    String userPassword = _controllerPassword.text.trim();

    if (userName.isEmpty || userEmail.isEmpty || userPassword.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackBar(waring: "Please fill in empty areas."));
    } else if (userPassword.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
          snackBar(waring: "Password must be at least 8 characters."));
    } else {
      Person person = Person(userName, userEmail, userPassword);
      int userId = await _registerDbHelper.insert(person);
      if (userId == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
            snackBar(waring: "This email address is already registered!"));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackBar(waring: "Ok :d", color: Colors.green));
        SharedPreferencesHelper.saveUserData("id", userId);
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

  SnackBar snackBar({required waring, Color color = Colors.red}) {
    return SnackBar(
      content: Text(
        waring,
        style: const TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
    );
  }
}
