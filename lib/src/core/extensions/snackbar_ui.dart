import 'package:flutter/material.dart';
import 'package:u16/src/core/core.dart';

extension SnackbarX on BuildContext {
  void showSnackbar(
    String message, {
    Color? backgroundColor,
    Color? color,
    void Function(SnackBarClosedReason reason)? onClose,
  }) {
    ScaffoldMessenger.of(this)
        .showSnackBar(
          SnackBar(
            backgroundColor: backgroundColor,
            content: Text(
              message,
              style:
                  Theme.of(this).customTheme.tHeading7?.copyWith(color: color),
            ),
            behavior: SnackBarBehavior.floating,
            showCloseIcon: true,
          ),
        )
        .closed
        .then(onClose ?? (_) {});
  }

  void showInfoSnackbar(
    String message, {
    void Function(SnackBarClosedReason reason)? onClose,
  }) {
    final scheme = Theme.of(this).colorScheme;
    showSnackbar(
      message,
      backgroundColor: scheme.primary,
      color: scheme.onPrimary,
      onClose: onClose,
    );
  }

  void showWarningSnackbar(
    String message, {
    void Function(SnackBarClosedReason reason)? onClose,
  }) {
    final scheme = Theme.of(this).colorScheme;
    showSnackbar(
      message,
      backgroundColor: scheme.secondary,
      color: scheme.onSecondary,
      onClose: onClose,
    );
  }

  void showErrorSnackbar(
    String message, {
    void Function(SnackBarClosedReason reason)? onClose,
  }) {
    final scheme = Theme.of(this).colorScheme;
    showSnackbar(
      message,
      backgroundColor: scheme.error,
      color: scheme.onError,
      onClose: onClose,
    );
  }
}
