// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$followersInfoHash() => r'ed569b3d0735b4e20b6e8e7502126b1cb91ec983';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef FollowersInfoRef = AutoDisposeFutureProviderRef<FollowersInfo>;

/// See also [followersInfo].
@ProviderFor(followersInfo)
const followersInfoProvider = FollowersInfoFamily();

/// See also [followersInfo].
class FollowersInfoFamily extends Family<AsyncValue<FollowersInfo>> {
  /// See also [followersInfo].
  const FollowersInfoFamily();

  /// See also [followersInfo].
  FollowersInfoProvider call({
    required String userId,
  }) {
    return FollowersInfoProvider(
      userId: userId,
    );
  }

  @override
  FollowersInfoProvider getProviderOverride(
    covariant FollowersInfoProvider provider,
  ) {
    return call(
      userId: provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'followersInfoProvider';
}

/// See also [followersInfo].
class FollowersInfoProvider extends AutoDisposeFutureProvider<FollowersInfo> {
  /// See also [followersInfo].
  FollowersInfoProvider({
    required this.userId,
  }) : super.internal(
          (ref) => followersInfo(
            ref,
            userId: userId,
          ),
          from: followersInfoProvider,
          name: r'followersInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$followersInfoHash,
          dependencies: FollowersInfoFamily._dependencies,
          allTransitiveDependencies:
              FollowersInfoFamily._allTransitiveDependencies,
        );

  final String userId;

  @override
  bool operator ==(Object other) {
    return other is FollowersInfoProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
