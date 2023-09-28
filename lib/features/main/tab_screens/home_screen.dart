import 'package:flutter/material.dart';
import 'package:flutter_final_project/constants/gaps.dart';
import 'package:flutter_final_project/constants/sizes.dart';
import 'package:flutter_final_project/features/main/tab_screens/models/mood_post_model.dart';
import 'package:flutter_final_project/features/main/tab_screens/repos/mood_post_repo.dart';
import 'package:flutter_final_project/features/main/tab_screens/view_models/mood_post_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(moodPostProvider).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size20,
        horizontal: Sizes.size20,
      ),
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return GestureDetector(
            onLongPress: () async {
              bool? shouldDelete = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Delete Mood Entry'),
                  content:
                      const Text('Are you sure you want to delete this entry?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              );

              if (shouldDelete == true) {
                await ref.read(moodPostRepo).deletePost(post.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Mood entry deleted successfully!')),
                );
              }
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: Sizes.size20),
              color: const Color(0xFF374151),
              child: Padding(
                padding: const EdgeInsets.all(Sizes.size20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mood: ${post.emojiType}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size20,
                      ),
                    ),
                    Gaps.v2,
                    Text(
                      post.text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size18,
                      ),
                    ),
                    Gaps.v10,
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        timeAgo(DateTime.parse(post.created)),
                        style: TextStyle(color: Colors.grey.shade200),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String timeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }
}
