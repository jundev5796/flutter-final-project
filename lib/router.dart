import 'package:flutter_final_project/features/authentication/sign_in_screen.dart';
import 'package:flutter_final_project/features/authentication/sign_up_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: SignInScreen.routeURL,
  routes: [
    GoRoute(
      path: SignInScreen.routeURL,
      name: SignInScreen.routeName,
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: SignUpScreen.routeURL,
      name: SignUpScreen.routeName,
      builder: (context, state) => const SignUpScreen(),
    )
  ],
);
