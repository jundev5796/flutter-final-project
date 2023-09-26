import 'package:flutter_final_project/features/authentication/repos/authentication_repo.dart';
import 'package:flutter_final_project/features/authentication/sign_in_screen.dart';
import 'package:flutter_final_project/features/authentication/sign_up_screen.dart';
import 'package:flutter_final_project/features/main/main_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  ref.watch(authState);
  return GoRouter(
    initialLocation: MainScreen.routeURL,
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        if (state.namedLocation != SignInScreen.routeURL &&
            state.namedLocation != SignUpScreen.routeURL) {
          return SignUpScreen.routeURL;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: SignUpScreen.routeURL,
        name: SignUpScreen.routeName,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: SignInScreen.routeURL,
        name: SignInScreen.routeName,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: MainScreen.routeURL,
        // path: "/:tab(home|post)",
        name: MainScreen.routeName,
        builder: (context, state) => const MainScreen(),
        // builder: (context, state) {
        //   final tab = state.pathParameters["tab"]!;
        //   return MainScreen(tab: tab);
        // },
      ),
    ],
  );
});
