import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Sign Up",
              textScaleFactor: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextField(
                controller: _controllerName,
                decoration: const InputDecoration(
                  label: Text("User Name"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
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
            )
          ],
        ),
      ),
    );
  }

  _clickHandler() {}
}
