import 'package:flutter/material.dart';
import 'package:flutter_final_project/constants/gaps.dart';
import 'package:flutter_final_project/constants/sizes.dart';
import 'package:flutter_final_project/features/main/main_screen.dart';
import 'package:flutter_final_project/features/main/tab_screens/auth_provider.dart';
import 'package:flutter_final_project/features/main/tab_screens/home_screen.dart';
import 'package:flutter_final_project/features/main/tab_screens/models/mood_post_model.dart';
import 'package:flutter_final_project/features/main/tab_screens/repos/mood_post_repo.dart';
import 'package:flutter_final_project/features/main/tab_screens/view_models/mood_post_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key});

  @override
  ConsumerState<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  final TextEditingController _controller = TextEditingController();
  String? selectedEmoji;

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  Future<void> _createMoodPost() async {
    final moodPost = MoodPostModel(
      created: DateTime.now().toIso8601String(),
      uid: ref.watch(currentUserUidProvider)!,
      emojiType: selectedEmoji ?? '',
      id: '',
      text: _controller.text,
    );

    await ref.read(moodPostProvider.notifier).createMoodPost(moodPost);

    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        backgroundColor: const Color(0xFF1F2937),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size20,
            horizontal: Sizes.size32,
          ),
          child: Column(
            children: [
              Gaps.v40,
              const Row(
                children: [
                  Text(
                    "How do you feel?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Gaps.v20,
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: BorderRadius.circular(Sizes.size14),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size2,
                    horizontal: Sizes.size16,
                  ),
                  child: TextField(
                    controller: _controller,
                    autocorrect: true,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    minLines: 7,
                    decoration: const InputDecoration(
                      hintText: "Write it down here!",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: Sizes.size16,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Gaps.v40,
              const Row(
                children: [
                  Text(
                    "What's your mood?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Gaps.v5,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Text(
                      '😀',
                      style: TextStyle(
                        fontSize: Sizes.size28,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedEmoji = '😀';
                      });
                    },
                  ),
                  IconButton(
                    icon: const Text(
                      '😍',
                      style: TextStyle(
                        fontSize: Sizes.size28,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedEmoji = '😍';
                      });
                    },
                  ),
                  IconButton(
                    icon: const Text(
                      '😊',
                      style: TextStyle(
                        fontSize: Sizes.size28,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedEmoji = '😊';
                      });
                    },
                  ),
                  IconButton(
                    icon: const Text(
                      '🥳',
                      style: TextStyle(
                        fontSize: Sizes.size28,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedEmoji = '🥳';
                      });
                    },
                  ),
                  IconButton(
                    icon: const Text(
                      '😭',
                      style: TextStyle(
                        fontSize: Sizes.size28,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedEmoji = '😭';
                      });
                    },
                  ),
                  IconButton(
                    icon: const Text(
                      '🤬',
                      style: TextStyle(
                        fontSize: Sizes.size28,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedEmoji = '🤬';
                      });
                    },
                  ),
                  IconButton(
                    icon: const Text(
                      '🫠',
                      style: TextStyle(
                        fontSize: Sizes.size28,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedEmoji = '🫠';
                      });
                    },
                  ),
                ],
              ),
              Gaps.v40,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size40,
                ),
                child: TextButton(
                  onPressed: _createMoodPost,
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
                    minimumSize: const Size(double.infinity, 0),
                  ),
                  child: const Text(
                    "Post",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
