import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_final_project/features/main/tab_screens/models/mood_post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoodPostRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createPost(MoodPostModel post) async {
    await _db.collection('moodPosts').add(post.toJson());
  }

  Future<void> deletePost(String id) async {
    await _db.collection('moodPosts').doc(id).delete();
  }

  Stream<List<MoodPostModel>> fetchPosts(String uid) {
    return _db
        .collection('moodPosts')
        .where('uid', isEqualTo: uid)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => MoodPostModel.fromFirestore(doc))
          .toList();
    });
  }
}

final Provider<MoodPostRepository> moodPostRepo =
    Provider((ref) => MoodPostRepository());
