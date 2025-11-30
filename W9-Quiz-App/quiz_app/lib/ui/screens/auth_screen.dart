import 'package:flutter/material.dart';
import 'package:quiz_app/ui/widgets/app_button.dart';
import 'package:quiz_app/ui/widgets/app_input.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key, required this.onLogIn});
  final Function(String, String) onLogIn;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        AppInput(label: "Email", onChanged: (value) => email = value),
        AppInput(label: "Password", onChanged: (value) => password = value),
        AppButton("Log In", onPressed: () => onLogIn(email, password), icon: Icons.login),
      ],
    );
  }
}
