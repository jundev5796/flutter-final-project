import 'package:flutter/material.dart';
import 'package:flutter_final_project/constants/gaps.dart';
import 'package:flutter_final_project/constants/sizes.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: Sizes.size2,
                horizontal: Sizes.size16,
              ),
              child: TextField(
                // controller: (), // Uncomment this if you want to use a controller
                autocorrect: true,
                keyboardType: TextInputType.multiline,
                maxLines: null, // Makes it expandable vertically
                minLines: 7, // Set this to your desired minimum lines
                decoration: InputDecoration(
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
        ],
      ),
    );
  }
}
