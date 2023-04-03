import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/l10n/l10n.dart';

class EditUsername extends StatefulWidget {
  const EditUsername({
    required this.value,
    super.key,
  });
  final String value;

  @override
  State<EditUsername> createState() => _EditUsernameState();
}

class _EditUsernameState extends State<EditUsername> {
  late final TextEditingController _controller;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (_controller.text.trim().isEmpty) {
      setState(() {
        _errorText = context.l10n.createUsernameIsEmpty;
      });
    } else {
      context.popRoute(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => context.popRoute(),
          ),
          actions: [
            TextButton(
              onPressed: _handleSave,
              child: Text(context.l10n.commonSave),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: ltPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.l10n.createUsernameChooseUsername,
                style: Theme.of(context).customTheme.tHeading6,
              ),
              Gaps.vGap10,
              TextField(
                controller: _controller,
                onChanged: (_) {
                  if (_errorText != null) {
                    setState(() {
                      _errorText = null;
                    });
                  }
                },
                decoration: InputDecoration(
                  hintText: context.l10n.createUsernameUsername,
                  errorText: _errorText,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                      setState(() {
                        _errorText = null;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
