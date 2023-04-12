import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/l10n/l10n.dart';

typedef PropertyFormBuilder<T> = Widget Function(
  BuildContext context,
  void Function(T? value) onChanged,
);

class EditDetailsProperty<T> extends StatefulWidget {
  const EditDetailsProperty({
    required this.initialValue,
    required this.builder,
    super.key,
  });
  final T? initialValue;
  final PropertyFormBuilder<T> builder;

  @override
  State<EditDetailsProperty<T>> createState() => _EditDetailsPropertyState();
}

class _EditDetailsPropertyState<T> extends State<EditDetailsProperty<T>> {
  _EditDetailsPropertyState();

  final _formKey = GlobalKey<FormState>();
  late final ValueNotifier<T?> _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = ValueNotifier(widget.initialValue);
  }

  // ignore: use_setters_to_change_properties
  void _onChanged(T? value) => _notifier.value = value;

  Future<void> _handleCancel() async {
    if (widget.initialValue != _notifier.value) {
      final isDiscardChanges = await showDiscardChangesDialog(context) ?? false;
      if (isDiscardChanges && context.mounted) {
        await context.popRoute(PopResult<T>.cancel());
      }
    } else {
      await context.popRoute(PopResult<T>.cancel());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: _handleCancel,
                style: TextButton.styleFrom(foregroundColor: AppColors.black),
                child: Text(context.l10n.commonCancel),
              ),
              TextButton(
                onPressed: () =>
                    context.popRoute(PopResult.data(value: _notifier.value)),
                child: Text(context.l10n.commonSave),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: ltPadding),
          child: Form(
            key: _formKey,
            child: widget.builder.call(
              context,
              _onChanged,
            ),
          ),
        ),
      ),
    );
  }
}
