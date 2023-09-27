import 'package:flutter/material.dart';
import 'package:flutter_final_project/constants/gaps.dart';
import 'package:flutter_final_project/constants/sizes.dart';
import 'package:flutter_final_project/features/authentication/sign_in_screen.dart';
import 'package:flutter_final_project/features/authentication/view_models/signup_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const String routeName = "signup";
  static const String routeURL = "/signup";
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _email = "";
  String _password = "";
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  void _onSignUpTap() async {
    ref.read(signUpForm.notifier).state = {
      "email": _email,
      "password": _password,
    };
    await ref.read(signUpProvider.notifier).signUp(context);
  }

  void _onLoginTap(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignInScreen()));
    // context.pop();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        backgroundColor: const Color(0xFF1F2937),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1F2937),
          elevation: 0,
          title: const Text(
            "🔥 MOOD 🔥",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size60,
          ),
          child: Column(
            children: [
              Gaps.v80,
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Join!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Gaps.v44,
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.shade400,
                      ),
                      borderRadius: BorderRadius.circular(Sizes.size28),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size2,
                        horizontal: Sizes.size16,
                      ),
                      child: TextField(
                        controller: _emailController,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: Sizes.size18,
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Gaps.v20,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.shade400,
                      ),
                      borderRadius: BorderRadius.circular(Sizes.size28),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size2,
                        horizontal: Sizes.size16,
                      ),
                      child: TextField(
                        controller: _passwordController,
                        autocorrect: false,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obscureText,
                        decoration: const InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: Sizes.size18,
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Gaps.v28,
                  TextButton(
                    onPressed: _onSignUpTap,
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF0c64E0),
                      backgroundColor: const Color(0xFF374151),
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size10,
                        horizontal: Sizes.size16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Sizes.size28),
                        side: BorderSide(color: Colors.grey.shade400),
                      ),
                      minimumSize: const Size(double.infinity,
                          0), // This will stretch the button horizontally
                    ),
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 300,
                  ),
                  TextButton(
                    onPressed: () => _onLoginTap(context),
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF0c64E0),
                      backgroundColor: const Color(0xFF374151),
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size10,
                        horizontal: Sizes.size16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Sizes.size28),
                        side: BorderSide(color: Colors.grey.shade400),
                      ),
                      minimumSize: const Size(double.infinity,
                          0), // This will stretch the button horizontally
                    ),
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
