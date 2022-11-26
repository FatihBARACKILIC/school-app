import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:school_app/db/register_db_helper.dart';
import 'package:school_app/helper/shared_preferences.dart';
import 'package:school_app/main.dart';
import 'package:school_app/screens/sign_up/sign_up_screen.dart';

class UserMainWidget extends StatefulWidget {
  const UserMainWidget({super.key});

  @override
  State<UserMainWidget> createState() => _UserMainWidgetState();
}

class _UserMainWidgetState extends State<UserMainWidget> {
  late List userData = List.filled(4, "null");

  @override
  void initState() {
    super.initState();
    idCheck();
    getUserData();
  }

  getUserData() async {
    RegisterDbHelper register = RegisterDbHelper();
    List lUserData = await register.getUserData(await getId());
    setState(() {
      userData[0] = lUserData[0] ?? "id";
      userData[1] = lUserData[1] ?? "User Name";
      userData[2] = lUserData[2] ?? "E-Mail";
      userData[3] = lUserData[3] ?? "Password";
    });
  }

  Future<int> getId() async =>
      await SharedPreferencesHelper.getUserData("id") ?? 0;

  idCheck() async {
    var id = await getId();

    if (id == 0) {
      signUpRoute();
    }
  }

  signUpRoute() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Welcome, ${userData[1]}",
          textScaleFactor: 1.5,
        ),
        toolbarHeight: MediaQuery.of(context).size.height * .05,
        actions: [
          IconButton(
              onPressed: () {
                SharedPreferencesHelper.removePreferences("id");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyApp(),
                  ),
                );
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text(
            "Tap back again to leave!",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
            textScaleFactor: 1.5,
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
        child: Text(
            "${userData[0]},${userData[1]},${userData[2]},${userData[3]}",
            textScaleFactor: 3),
      ),
    );
  }
}
