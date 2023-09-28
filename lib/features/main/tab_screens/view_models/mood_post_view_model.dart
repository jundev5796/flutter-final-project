import 'package:flutter_final_project/features/main/tab_screens/auth_provider.dart';
import 'package:flutter_final_project/features/main/tab_screens/models/mood_post_model.dart';
import 'package:flutter_final_project/features/main/tab_screens/repos/mood_post_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoodPostViewModel extends StateNotifier<List<MoodPostModel>> {
  MoodPostViewModel(this._repo, this._uid) : super([]) {
    loadMoodPosts(_uid);
  }

  final MoodPostRepository _repo;
  final String _uid;

  Future<void> createMoodPost(MoodPostModel post) async {
    await _repo.createPost(post);
  }

  void loadMoodPosts(String uid) {
    _repo.fetchPosts(uid).listen((posts) {
      state = posts;
    });
  }
}

final moodPostProvider =
    StateNotifierProvider<MoodPostViewModel, List<MoodPostModel>>((ref) {
  final repo = ref.watch(moodPostRepo);
  final uid = ref.watch(currentUserUidProvider);
  return MoodPostViewModel(repo, uid!);
});
