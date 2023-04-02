import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/auth/auth.dart';
import 'package:u16/src/features/profile/providers/providers.dart';
import 'package:u16/src/gen/assets.gen.dart';
import 'package:u16/src/l10n/l10n.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({
    required this.userId,
    this.isCurrentUser = false,
    super.key,
  });
  final String userId;
  final bool isCurrentUser;

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  late final List<_ProfileTabs> _tabs;
  DateTime lastRefreshTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _tabs = widget.isCurrentUser ? _currentUserTabs : _userTabs;
    _tabController = TabController(length: _tabs.length, vsync: this)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildFollowAndMessageButtons() {
    final followState =
        ref.watch(followOtherUserControllerProvider(otherId: widget.userId));
    final isFollowed = followState.valueOrNull ?? false;
    final controller = ref.read(
      followOtherUserControllerProvider(otherId: widget.userId).notifier,
    );

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: ltPadding / 2),
            child: FilledButton(
              onPressed: followState.isLoading
                  ? null
                  : () {
                      if (isFollowed) {
                        // unfollow
                        controller.unfollow();
                      } else {
                        // follow
                        controller.follow();
                      }
                    },
              style: isFollowed
                  ? FilledButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.outlineVariant,
                      foregroundColor:
                          Theme.of(context).colorScheme.onBackground,
                    )
                  : null,
              child: Text(
                isFollowed
                    ? context.l10n.profileFollowing
                    : context.l10n.profileFollow,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: ltPadding / 2),
            child: FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.outlineVariant,
                foregroundColor: Theme.of(context).colorScheme.onBackground,
              ),
              child: Text(context.l10n.commonMessage),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileHeader() {
    final followersInfo =
        ref.watch(followersInfoProvider(userId: widget.userId)).valueOrNull;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ltPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 40,
                child: ClipOval(
                  child:
                      CachedNetworkImage(imageUrl: 'https://i.pravatar.cc/300'),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          '${followersInfo?.followers ?? ''}',
                          style: Theme.of(context).customTheme.tHeading6Inter,
                        ),
                        Text(
                          context.l10n.profileFollowers,
                          style: Theme.of(context).customTheme.tHeading7,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '${followersInfo?.followings ?? ''}',
                          style: Theme.of(context).customTheme.tHeading6Inter,
                        ),
                        Text(
                          context.l10n.profileFollowing,
                          style: Theme.of(context).customTheme.tHeading7,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: ltPadding),
            child: Text(
              'my bio\nline 1\nline2',
              style: Theme.of(context).customTheme.tHeading6,
            ),
          ),
          if (!widget.isCurrentUser) _buildFollowAndMessageButtons()
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.surfaceVariant,
          ),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        tabs: [
          for (int i = 0; i < _tabs.length; i++)
            Tab(
              child: SvgPicture.asset(
                _tabs[i].asset,
                colorFilter: ColorFilter.mode(
                  _tabController.index == i
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                  BlendMode.srcIn,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTabViews() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: _tabs.map((tab) {
          return TabPageWrapper(
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemBuilder: (_, index) => ListTile(
                title: Text('${tab.name} - $index'),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAppBar(AppUser user) {
    return SliverAppBar(
      pinned: true,
      centerTitle: false,
      title: Text(user.username),
    );
  }

  Future<bool> _refreshUser() async {
    await Future.wait([
      ref.refresh(userProvider(userId: widget.userId).future),
      ref.refresh(followersInfoProvider(userId: widget.userId).future),
    ]);

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final userAsyncValue = ref.watch(userProvider(userId: widget.userId));

    return userAsyncValue.when(
      data: (user) {
        if (user == null) {
          return const Center(
            child: Text('User not found'), // TODO user not found case
          );
        }
        final pinnedHeaderHeight =
            MediaQuery.of(context).padding.top + kToolbarHeight;

        return Scaffold(
          body: PullToRefreshNotification(
            pullBackDuration: pullToRefreshPullbackDuration,
            maxDragOffset: pullToRefreshMaxDragOffset,
            onRefresh: _refreshUser,
            child: ExtendedNestedScrollView(
              onlyOneScrollInBody: true,
              pinnedHeaderSliverHeightBuilder: () => pinnedHeaderHeight,
              headerSliverBuilder: (context, _) {
                return [
                  _buildAppBar(user),
                  PullToRefreshContainer(
                    (info) => SliverToBoxAdapter(
                      child: PullToRefreshIndicator(info: info),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: _buildProfileHeader(),
                  ),
                ];
              },
              body: Column(
                children: [
                  _buildTabBar(),
                  _buildTabViews(),
                ],
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) => const Center(
        child: Text('error'), // TODO error page
      ),
      loading: () => const Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}

enum _ProfileTabs {
  collection,
  team,
  video,
  personalDetails,
  notifications,
}

const _currentUserTabs = _ProfileTabs.values;
const _userTabs = <_ProfileTabs>[
  _ProfileTabs.collection,
  _ProfileTabs.team,
  _ProfileTabs.video,
  _ProfileTabs.personalDetails,
];

extension _ProfileTabsUI on _ProfileTabs {
  String get asset {
    switch (this) {
      case _ProfileTabs.collection:
        return Assets.images.collectionTabIcon;
      case _ProfileTabs.team:
        return Assets.images.teamTabIcon;
      case _ProfileTabs.video:
        return Assets.images.videoTabIcon;
      case _ProfileTabs.personalDetails:
        return Assets.images.personalDetailsTabIcon;
      case _ProfileTabs.notifications:
        return Assets.images.notificationsTabIcon;
    }
  }
}

class TabPageWrapper extends StatefulWidget {
  const TabPageWrapper({required this.child, super.key});
  final Widget child;

  @override
  State<TabPageWrapper> createState() => _TabPageWrapperState();
}

class _TabPageWrapperState extends State<TabPageWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}

class _ProfileAppBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      color: Colors.red.shade100,
      child: const Text('Username'),
    );
  }

  @override
  double get maxExtent => kToolbarHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
