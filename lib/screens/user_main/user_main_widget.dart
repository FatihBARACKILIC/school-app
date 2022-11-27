import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:school_app/colors/colors.dart';
import 'package:school_app/db/register_db_helper.dart';
import 'package:school_app/helper/shared_preferences.dart';
import 'package:school_app/main.dart';
import 'package:school_app/screens/sign_up/sign_up_screen.dart';
import 'package:school_app/screens/user_main/screens/home.dart';
import 'package:school_app/screens/user_main/screens/add_lesson.dart';
import 'package:school_app/screens/user_main/screens/user.dart';

class UserMainWidget extends StatefulWidget {
  const UserMainWidget({super.key});

  @override
  State<UserMainWidget> createState() => _UserMainWidgetState();
}

class _UserMainWidgetState extends State<UserMainWidget> {
  List userData = List.filled(4, "null");
  final List _widgets = <Widget>[];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    idCheck();
    getUserData();

    setState(() {
      _widgets.add(const HomeWidget());
      _widgets.add(const AddLesson());
      _widgets.add(const UserUpdate());
    });
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Welcome, ${userData[1]}",
        ),
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
        child: _widgets[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_sharp),
            backgroundColor: Colors.deepPurple,
            label: "Add Lesson",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            backgroundColor: Colors.deepPurple,
            label: "User",
          ),
        ],
        backgroundColor: Colors.deepPurple,
        unselectedItemColor: darkColor,
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 50,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
