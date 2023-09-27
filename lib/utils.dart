import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// bool isDarkMode(BuildContext context) =>
//     MediaQuery.of(context).platformBrightness == Brightness.dark;

void showFirebaseErrorSnack(
  BuildContext context,
  Object? error,
) {
  final errorMessage =
      error is FirebaseException ? error.message : "Something went wrong.";
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errorMessage!),
    ),
  );
}
