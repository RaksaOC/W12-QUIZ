import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key, required this.onLogIn});
  final Function(String, String) onLogIn;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Log In"),
        TextField(
          decoration: InputDecoration(labelText: "Email"),
          onChanged: (value) => email = value,
        ),
        TextField(
          decoration: InputDecoration(labelText: "Password"),
          onChanged: (value) => password = value,
        ),
        ElevatedButton(
          onPressed: () => onLogIn(email, password),
          child: Text("Log In"),
        ),
      ],
    );
  }
}
