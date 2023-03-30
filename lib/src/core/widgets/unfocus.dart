import 'package:flutter/material.dart';

/// Implements 'unfocus on background tap' for its child.
/// Wrap application widget to implement the behaviour application-wide.
class Unfocus extends StatelessWidget {
  const Unfocus({required this.child, super.key});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: child,
    );
  }
}
