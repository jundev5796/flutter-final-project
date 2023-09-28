import 'package:cloud_firestore/cloud_firestore.dart';

class MoodPostModel {
  final String created;
  final String uid;
  final String emojiType;
  final String id;
  final String text;

  MoodPostModel({
    required this.created,
    required this.uid,
    required this.emojiType,
    required this.id,
    required this.text,
  });

  MoodPostModel.empty()
      : created = "",
        uid = "",
        emojiType = "",
        id = "",
        text = "";

  MoodPostModel.fromFirestore(QueryDocumentSnapshot doc)
      : id = doc.id,
        created = (doc.data() as Map<String, dynamic>)['created'],
        uid = (doc.data() as Map<String, dynamic>)['uid'],
        emojiType = (doc.data() as Map<String, dynamic>)['emojiType'],
        text = (doc.data() as Map<String, dynamic>)['text'];

  Map<String, dynamic> toJson() =>
      {'created': created, 'uid': uid, 'emojiType': emojiType, 'text': text};
}
