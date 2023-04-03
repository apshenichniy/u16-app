import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:u16/src/gen/assets.gen.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    required this.imageUrl,
    this.onEditPressed,
    this.showEditButton = false,
    this.radius = 40.0,
    super.key,
  });
  final String imageUrl;
  final bool showEditButton;
  final VoidCallback? onEditPressed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final widget = CircleAvatar(
      radius: radius,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
        ),
      ),
    );

    return showEditButton
        ? Center(
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                widget,
                Positioned(
                  right: -8,
                  bottom: 0,
                  child: SizedBox.square(
                    dimension: 30,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: onEditPressed,
                      icon: SvgPicture.asset(Assets.images.editIcon),
                      style: IconButton.styleFrom(
                        disabledBackgroundColor:
                            Theme.of(context).colorScheme.background,
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        shadowColor: Theme.of(context).colorScheme.onBackground,
                        elevation: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : widget;
  }
}
