import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:u16/src/gen/assets.gen.dart';

class EditPersonalDetails extends StatefulWidget {
  const EditPersonalDetails({super.key});

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
        actions: const [
          TextButton(
            onPressed: null,
            child: Text('Save'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: 'https://i.pravatar.cc/300',
                      ),
                    ),
                  ),
                  Positioned(
                    right: -8,
                    bottom: 0,
                    child: SizedBox.square(
                      dimension: 30,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: SvgPicture.asset(Assets.images.editIcon),
                        style: IconButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          shadowColor:
                              Theme.of(context).colorScheme.onBackground,
                          elevation: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
