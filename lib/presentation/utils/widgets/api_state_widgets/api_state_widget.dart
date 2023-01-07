import 'package:flutter/material.dart';
import 'package:grow_it_green/presentation/utils/helpers/api_state.dart';
import 'package:grow_it_green/presentation/utils/widgets/api_state_widgets/app_error.dart';
import 'package:grow_it_green/presentation/utils/widgets/api_state_widgets/app_progress_indicator.dart';

export 'app_error.dart';
export 'app_progress_indicator.dart';

class APIStateWidget<T> extends StatelessWidget {
  const APIStateWidget({
    super.key,
    required this.successWidget,
    required this.apiState,
    required this.emptyErrorMessage,
    this.onInitialState,
    this.onSuccessState,
    this.onRetry,
    this.initialWidget,
    this.loadingWidget,
    this.failureWidget,
    this.retryText,
  });

  final APIState<T> apiState;
  final Widget successWidget;
  final void Function()? onInitialState;
  final void Function()? onSuccessState;
  final void Function()? onRetry;
  final Widget? failureWidget;
  final Widget? loadingWidget;
  final Widget? initialWidget;
  final String emptyErrorMessage;
  final String? retryText;

  @override
  Widget build(BuildContext context) {
    switch (apiState.state) {
      case APICallState.initial:
        return _buildInitialWidget();
      case APICallState.loading:
        return _buildLoadingWidget();
      case APICallState.loaded:
        onSuccessState?.call();
        if (apiState.isEmpty) {
          return _buildFailureWidget(emptyErrorMessage);
        }
        return successWidget;
      case APICallState.failure:
        return _buildFailureWidget();
    }
  }

  Widget _buildFailureWidget([String? errorMessage]) {
    return failureWidget ??
        AppError(
          message: apiState.error ?? errorMessage ?? '',
          retry: onRetry,
          retryText: retryText,
        );
  }

  Widget _buildLoadingWidget() => loadingWidget ?? const AppProgressIndicator();

  Widget _buildInitialWidget() {
    onInitialState?.call();
    return initialWidget ?? const SizedBox();
  }
}
