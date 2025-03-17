import 'package:flutter/material.dart';

class AppUtils {
  static void showSnackBar(BuildContext context, String? err, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          err ?? "Something went wrong",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: color,
      ),
    );
  }
}
