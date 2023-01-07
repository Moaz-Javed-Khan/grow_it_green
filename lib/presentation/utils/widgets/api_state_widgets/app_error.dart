import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  const AppError({
    super.key,
    required this.message,
    this.retry,
    this.retryText,
    this.isLoading = false,
    this.hideRetry = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
  });

  final String message;
  final String? retryText;
  final void Function()? retry;
  final bool isLoading;
  final bool hideRetry;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: padding,
          child: Text(
            message,
            textAlign: TextAlign.center,
          ),
        ),
        // if (!hideRetry && retry != null)
        //   Padding(
        //     padding: const EdgeInsets.all(48),
        //     child: PrimaryButton(
        //       text: retryText ?? 'Try again',
        //       onPressed: retry,
        //       isLoading: isLoading,
        //     ),
        //   ),
      ],
    );
  }
}
