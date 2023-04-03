import 'package:flutter/material.dart';
import 'package:u16/src/core/core.dart';

class PropertyTile extends StatelessWidget {
  const PropertyTile({
    required this.title,
    this.placeholder,
    this.value,
    this.onTap,
    super.key,
  });
  final String title;
  final String? placeholder;
  final String? value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final valueText = value ?? (placeholder ?? '');
    final valueStyle = value != null
        ? Theme.of(context).customTheme.tHeading6
        : Theme.of(context)
            .customTheme
            .tHeading6
            ?.copyWith(color: Theme.of(context).colorScheme.outline);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .customTheme
                  .tHeading6
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              valueText,
              style: valueStyle,
            ),
          ],
        ),
      ),
    );
  }
}
