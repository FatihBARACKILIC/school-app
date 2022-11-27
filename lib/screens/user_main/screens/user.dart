import 'package:flutter/material.dart';
import 'package:school_app/db/register_db_helper.dart';
import 'package:school_app/helper/shared_preferences.dart';

class UserUpdate extends StatefulWidget {
  const UserUpdate({super.key});

  @override
  State<UserUpdate> createState() => _UserUpdateState();
}

class _UserUpdateState extends State<UserUpdate> {
  final RegisterDbHelper _registerDbHelper = RegisterDbHelper();

  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerUserEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  int _id = 0;

  @override
  void initState() {
    super.initState();

    getUserData();
  }

  void getUserData() async {
    _id = await SharedPreferencesHelper.getUserData("id") ?? 0;
    List userData = await _registerDbHelper.getUserData(_id);

    setState(() {
      _controllerUserName.text = userData[1];
      _controllerUserEmail.text = userData[2];
      _controllerPassword.text = userData[3];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          children: <Widget>[
            const Text(
              "Update",
              textScaleFactor: 5,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextField(
                controller: _controllerUserName,
                decoration: const InputDecoration(
                  label: Text("User Name"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextField(
                controller: _controllerUserEmail,
                decoration: const InputDecoration(
                  label: Text("E-Mail"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextField(
                controller: _controllerPassword,
                decoration: const InputDecoration(
                  label: Text("Password"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _clickHandler,
                  child: const Text("Update"),
                ),
              ),
            ),
          ],
        ));
  }

  _clickHandler() async {
    String userName = _controllerUserName.text.trim();
    String eMail = _controllerUserEmail.text.trim();
    String password = _controllerPassword.text.trim();

    if (userName.isNotEmpty && eMail.isNotEmpty && password.isNotEmpty) {
      int result =
          await _registerDbHelper.update(_id, userName, eMail, password);
      if (result > 0) {
        runSnackbar(content: "Ok :d", color: Colors.green);
      } else {
        runSnackbar(content: "Error.");
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(_snackBar(
        content: "Fill All area!",
      ));
    }
  }

  void runSnackbar({required String content, Color color = Colors.red}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(_snackBar(content: content, color: color));
  }

  SnackBar _snackBar({var content, Color color = Colors.red}) {
    return SnackBar(
      content: Text(
        "$content",
        textScaleFactor: 1.5,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
    );
  }
}
