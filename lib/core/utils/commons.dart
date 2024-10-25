

import 'package:flutter/material.dart';

class Common {
  static showSnackBar(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        key: Key(mensaje),
        content: Text(mensaje),
        duration: const Duration(seconds: 4),
        padding: const EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  static void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
