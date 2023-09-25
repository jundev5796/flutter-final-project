import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = "login";
  static const String routeURL = "/login";
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: const Scaffold(),
    );
  }
}
