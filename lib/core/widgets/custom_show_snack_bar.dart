import 'package:flutter/material.dart';

class CustomShowSnackBar {
  static void show(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          message,
          style: const TextStyle(fontSize: 12),
        ),
      ),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      padding: EdgeInsets.zero,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
