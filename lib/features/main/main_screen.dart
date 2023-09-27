import 'package:flutter/material.dart';
import 'package:flutter_final_project/features/authentication/repos/authentication_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends ConsumerStatefulWidget {
  static const String routeName = "main";
  static const String routeURL = "/main";
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<MainScreen> {
  void _onItemSelected(String value) {
    switch (value) {
      case 'Sign out':
        ref.read(authRepo).signOut();
        context.go("/");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          PopupMenuButton<String>(
            offset: const Offset(0, 40),
            icon: const FaIcon(
              FontAwesomeIcons.gear,
              color: Colors.white,
            ),
            onSelected: _onItemSelected,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Sign out',
                child: Text('Sign out'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
