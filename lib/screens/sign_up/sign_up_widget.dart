import 'package:flutter/material.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  final snackBar = const SnackBar(
    content: Text(
      "Please fill in empty areas.",
      style: TextStyle(
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
  );

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
                padding: const EdgeInsets.only(top: 8),
                child: TextField(
                  controller: _controllerName,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text("User Name"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
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
                padding: const EdgeInsets.only(top: 8),
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
                padding: const EdgeInsets.only(top: 8),
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
            ],
          ),
        ),
      ),
    );
  }

  void _clickHandler() {
    String userName = _controllerName.text.trim();
    String userEmail = _controllerEmail.text.trim();
    String userPassword = _controllerPassword.text.trim();

    if (userName.isEmpty || userEmail.isEmpty || userPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {}
  }
}
