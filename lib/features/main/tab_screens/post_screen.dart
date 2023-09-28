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
              Gaps.v10,
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
            ],
          ),
        ),
      ),
    );
  }
}
