import 'package:flutter/material.dart';
import 'package:u16/src/core/core.dart';

class PropertyTile<T> extends StatelessWidget {
  const PropertyTile({
    required this.title,
    this.placeholder,
    this.value,
    this.onTap,
    super.key,
  });
  final String title;
  final String? placeholder;
  final T? value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final valueText = value?.toString() ?? (placeholder ?? '');
    final valueStyle = value != null
        ? TextStyle(color: Theme.of(context).colorScheme.outline)
        : null;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.h6Medium,
            ),
            Text(valueText),
          ],
        ),
      ),
    );
  }
}
