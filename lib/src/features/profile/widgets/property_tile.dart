import 'package:flutter/material.dart';
import 'package:u16/src/gen/fonts.gen.dart';

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
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontFamily: FontFamily.sFProDisplay,
                    color: Colors.black,
                  ),
            ),
            Text(
              valueText,
              style: const TextStyle(fontSize: 16),
              //style: valueStyle,
            ),
          ],
        ),
      ),
    );
  }
}
