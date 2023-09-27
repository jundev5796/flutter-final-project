import 'package:flutter/material.dart';
import 'package:flutter_final_project/constants/gaps.dart';
import 'package:flutter_final_project/constants/sizes.dart';
import 'package:flutter_final_project/features/authentication/sign_up_screen.dart';
import 'package:flutter_final_project/features/authentication/view_models/signin_view_model.dart';
import 'package:flutter_final_project/features/authentication/view_models/signup_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends ConsumerStatefulWidget {
  static const String routeName = "login";
  static const String routeURL = "/login";
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Map<String, String> formData = {};
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

  void _onSignUpTap(BuildContext context) async {
    context.pop();
    // context.pushNamed(SignUpScreen.routeName);
  }

  void _onLoginTap() {
    ref.read(loginProvider.notifier).login(_email, _password, context);
    // if (_formKey.currentState != null) {
    //   if (_formKey.currentState!.validate()) {
    //     _formKey.currentState!.save();
    //     ref.read(loginProvider.notifier).login(
    //           formData["email"]!,
    //           formData["password"]!,
    //           context,
    //         );
    //     // context.goNamed(InterestsScreen.routeName);
    //   }
    // }
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
          automaticallyImplyLeading: false,
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
                    "Welcome!",
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
                    onPressed: _onLoginTap,
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
                  const SizedBox(
                    height: 300,
                  ),
                  TextButton(
                    onPressed: () => _onSignUpTap(context),
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
                      "Create an account",
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
