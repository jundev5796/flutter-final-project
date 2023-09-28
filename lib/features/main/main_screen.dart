import 'package:flutter/material.dart';
import 'package:flutter_final_project/constants/sizes.dart';
import 'package:flutter_final_project/features/authentication/repos/authentication_repo.dart';
import 'package:flutter_final_project/features/main/tab_screens/auth_provider.dart';
import 'package:flutter_final_project/features/main/tab_screens/home_screen.dart';
import 'package:flutter_final_project/features/main/tab_screens/post_screen.dart';
import 'package:flutter_final_project/features/main/widgets/nav_tab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends ConsumerStatefulWidget {
  static const String routeName = "main";
  final String tab;
  const MainScreen({super.key, required this.tab});

  @override
  ConsumerState<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<MainScreen> {
  final List<String> _tabs = ["home", "post"];

  void _onTap(int index) {
    ref.read(currentTabIndexProvider.notifier).state = index;
    context.go("/${_tabs[index]}"); // Navigate to the route
  }

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
    int selectedIndex = ref.watch(currentTabIndexProvider.notifier).state;

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
      body: Stack(
        children: [
          Offstage(
            offstage: selectedIndex != 0,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: selectedIndex != 1,
            child: const PostScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: const Color(0xFF1F2937),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size16,
            horizontal: Sizes.size12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                isSelected: selectedIndex == 0,
                icon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
              ),
              NavTab(
                isSelected: selectedIndex == 1,
                icon: FontAwesomeIcons.pen,
                onTap: () => _onTap(1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
