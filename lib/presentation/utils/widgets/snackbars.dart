import 'package:flutter/material.dart';

class Snackbars {
  const Snackbars._();

  static SnackBar success(String text) => _Snackbar.snackbar(text, Icons.check);

  static SnackBar error(String text) =>
      _Snackbar.snackbar(text, Icons.error_outline);

  static SnackBar info(String text) =>
      _Snackbar.snackbar(text, Icons.info_outline);
}

class _Snackbar {
  const _Snackbar._();

  static SnackBar snackbar(String text, IconData icon) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
