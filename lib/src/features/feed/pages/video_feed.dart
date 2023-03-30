import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:u16/src/core/core.dart';

@RoutePage()
class VideoFeedPage extends ConsumerStatefulWidget {
  const VideoFeedPage({super.key});
  @override
  ConsumerState<VideoFeedPage> createState() => _VideoFeedPageState();
}

class _VideoFeedPageState extends ConsumerState<VideoFeedPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final random = Random();
    final maxColors = Colors.accents.length;
    return Stack(
      children: [
        PageView.builder(
          physics: const CustomPageViewScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final color = Colors.accents[random.nextInt(maxColors)];
            return Container(
              height: double.infinity,
              width: double.infinity,
              color: color,
              child: Center(
                child: Text(
                  'video: $index',
                  style: Theme.of(context).customTheme.tHeading4,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class CustomPageViewScrollPhysics extends ScrollPhysics {
  const CustomPageViewScrollPhysics({super.parent});

  @override
  CustomPageViewScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomPageViewScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  SpringDescription get spring => const SpringDescription(
        mass: 150,
        stiffness: 100,
        damping: 1,
      );
}
