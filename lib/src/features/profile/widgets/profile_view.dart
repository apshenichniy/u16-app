import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/auth/auth.dart';
import 'package:u16/src/features/profile/providers/providers.dart';
import 'package:u16/src/features/profile/widgets/widgets.dart';
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

    return Padding(
      padding: const EdgeInsets.only(bottom: ltPadding / 2),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: ltPadding / 2),
              child: followState.isLoading
                  ? FilledButton(
                      onPressed: () {},
                      child: const CupertinoActivityIndicator(
                        color: AppColors.white,
                      ),
                    )
                  : FilledButton.icon(
                      icon: Icon(isFollowed ? Icons.check : Icons.add),
                      onPressed:
                          isFollowed ? controller.unfollow : controller.follow,
                      label: Text(
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
              child: FilledButton.icon(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.superLightGray,
                  foregroundColor: AppColors.black,
                ),
                icon: const Icon(Icons.send),
                label: Text(context.l10n.commonMessage),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(AppUser user) {
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
              const Avatar(imageUrl: 'https://i.pravatar.cc/300'),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          '${followersInfo?.followers ?? ''}',
                          style: AppTextStyles.h6Inter,
                        ),
                        Text(
                          context.l10n.profileFollowers,
                          style: AppTextStyles.h7,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '${followersInfo?.followings ?? ''}',
                          style: AppTextStyles.h6Inter,
                        ),
                        Text(
                          context.l10n.profileFollowing,
                          style: AppTextStyles.h7,
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
              user.bio ?? '',
              //style: Theme.of(context).customTheme.tHeading6,
              maxLines: 3,
              overflow: TextOverflow.clip,
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
        dividerColor: AppColors.lightGray,
        controller: _tabController,
        tabs: [
          for (int i = 0; i < _tabs.length; i++)
            Tab(
              child: SvgPicture.asset(
                _tabs[i].asset,
                colorFilter: _tabController.index == i
                    ? const ColorFilter.mode(
                        AppColors.blueNavigation,
                        BlendMode.srcIn,
                      )
                    : null,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTabViews(AppUser user) {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          const TeamTabView(),
          const VideoCollectionTabView(),
          PersonalDetailsTabView(
            user: user,
            isCurrentUser: widget.isCurrentUser,
          ),
          if (widget.isCurrentUser) const NotificationsTabView(),
        ],
      ),
    );
  }

  Widget _buildAppBar(AppUser user) {
    const daysStreak = 51;

    return SliverAppBar(
      pinned: true,
      centerTitle: false,
      elevation: 0,
      backgroundColor: AppColors.white,
      title: Text(user.username),
      actions: [
        if (widget.isCurrentUser)
          Padding(
            padding: const EdgeInsets.only(right: ltPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                SvgPicture.asset(Assets.images.daysStreak),
                Gaps.hGap8,
                Text(
                  '$daysStreak ${context.l10n.commonDays}',
                  style: const TextStyle(
                    //fontFamily: FontFamily.uniNeue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }

  Future<bool> _refreshUser() async {
    HapticFeedback.mediumImpact().ignore();
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
                    child: _buildProfileHeader(user),
                  ),
                ];
              },
              body: Column(
                children: [
                  _buildTabBar(),
                  _buildTabViews(user),
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

const _currentUserTabs = <_ProfileTabs>[
  // _ProfileTabs.collection,
  _ProfileTabs.team,
  _ProfileTabs.video,
  _ProfileTabs.personalDetails,
  _ProfileTabs.notifications,
];

const _userTabs = <_ProfileTabs>[
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
