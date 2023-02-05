import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  const AppError({
    super.key,
    required this.message,
    this.retry,
  });

  final String message;
  final void Function()? retry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            message,
            textAlign: TextAlign.center,
          ),
        ),
        if (retry != null)
          Padding(
            padding: const EdgeInsets.all(48),
            child: ElevatedButton(
              onPressed: retry,
              child: const Text('Try again'),
            ),
          ),
      ],
    );
  }
}
