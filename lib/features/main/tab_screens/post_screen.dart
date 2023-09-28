import 'package:flutter/material.dart';
import 'package:flutter_final_project/constants/gaps.dart';
import 'package:flutter_final_project/constants/sizes.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _controller = TextEditingController();

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _appendEmoji(String emoji) {
    _controller.text = _controller.text + emoji;
    _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: _controller.text.length),
    );
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
                    onPressed: () => _appendEmoji('😀'),
                  ),
                  IconButton(
                    icon: const Text(
                      '😍',
                      style: TextStyle(
                        fontSize: Sizes.size28,
                      ),
                    ),
                    onPressed: () => _appendEmoji('😍'),
                  ),
                  IconButton(
                    icon: const Text(
                      '😊',
                      style: TextStyle(
                        fontSize: Sizes.size28,
                      ),
                    ),
                    onPressed: () => _appendEmoji('😊'),
                  ),
                  IconButton(
                    icon: const Text(
                      '🥳',
                      style: TextStyle(
                        fontSize: Sizes.size28,
                      ),
                    ),
                    onPressed: () => _appendEmoji('🥳'),
                  ),
                  IconButton(
                    icon: const Text(
                      '😭',
                      style: TextStyle(
                        fontSize: Sizes.size28,
                      ),
                    ),
                    onPressed: () => _appendEmoji('😭'),
                  ),
                  IconButton(
                    icon: const Text(
                      '🤬',
                      style: TextStyle(
                        fontSize: Sizes.size28,
                      ),
                    ),
                    onPressed: () => _appendEmoji('🤬'),
                  ),
                  IconButton(
                    icon: const Text(
                      '🫠',
                      style: TextStyle(
                        fontSize: Sizes.size28,
                      ),
                    ),
                    onPressed: () => _appendEmoji('🫠'),
                  ),
                ],
              ),
              Gaps.v40,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size40,
                ),
                child: TextButton(
                  onPressed: () {},
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
