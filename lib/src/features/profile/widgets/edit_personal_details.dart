import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/auth/models/app_user.dart';
import 'package:u16/src/features/profile/widgets/widgets.dart';
import 'package:u16/src/l10n/l10n.dart';

class EditPersonalDetails extends StatefulWidget {
  const EditPersonalDetails({required this.user, super.key});
  final AppUser user;

  @override
  State<EditPersonalDetails> createState() => _EditPersonalDetailsState();
}

class _EditPersonalDetailsState extends State<EditPersonalDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.popRoute(),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(context.l10n.commonSave),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: ltPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Avatar(
                imageUrl: 'https://i.pravatar.cc/300',
                showEditButton: true,
              ),
              Gaps.vGapPadding,
              divider1,
              PropertyTile(
                title: context.l10n.createUsernameUsername,
                value: widget.user.username,
                onTap: () async {
                  final username = await context.router.pushWidget<String>(
                    EditUsernameView(
                      username: widget.user.username,
                    ),
                  );
                },
              ),
              divider1,
              //const PropertyTile(),
            ],
          ),
        ),
      ),
    );
  }
}
