import 'package:flutter/material.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';

class PullToRefreshIndicator extends StatelessWidget {
  const PullToRefreshIndicator({super.key, this.info});
  final PullToRefreshScrollNotificationInfo? info;

  @override
  Widget build(BuildContext context) {
    if (info == null) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: info?.dragOffset ?? 0.0,
      child: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
