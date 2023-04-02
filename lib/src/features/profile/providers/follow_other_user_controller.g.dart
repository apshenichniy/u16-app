// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_other_user_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$followOtherUserControllerHash() =>
    r'56ff970ee119a0dbe125c14c59d144392e4b3aed';

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

abstract class _$FollowOtherUserController
    extends BuildlessAutoDisposeAsyncNotifier<bool> {
  late final String otherId;

  Future<bool> build({
    required String otherId,
  });
}

/// See also [FollowOtherUserController].
@ProviderFor(FollowOtherUserController)
const followOtherUserControllerProvider = FollowOtherUserControllerFamily();

/// See also [FollowOtherUserController].
class FollowOtherUserControllerFamily extends Family<AsyncValue<bool>> {
  /// See also [FollowOtherUserController].
  const FollowOtherUserControllerFamily();

  /// See also [FollowOtherUserController].
  FollowOtherUserControllerProvider call({
    required String otherId,
  }) {
    return FollowOtherUserControllerProvider(
      otherId: otherId,
    );
  }

  @override
  FollowOtherUserControllerProvider getProviderOverride(
    covariant FollowOtherUserControllerProvider provider,
  ) {
    return call(
      otherId: provider.otherId,
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
  String? get name => r'followOtherUserControllerProvider';
}

/// See also [FollowOtherUserController].
class FollowOtherUserControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FollowOtherUserController,
        bool> {
  /// See also [FollowOtherUserController].
  FollowOtherUserControllerProvider({
    required this.otherId,
  }) : super.internal(
          () => FollowOtherUserController()..otherId = otherId,
          from: followOtherUserControllerProvider,
          name: r'followOtherUserControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$followOtherUserControllerHash,
          dependencies: FollowOtherUserControllerFamily._dependencies,
          allTransitiveDependencies:
              FollowOtherUserControllerFamily._allTransitiveDependencies,
        );

  final String otherId;

  @override
  bool operator ==(Object other) {
    return other is FollowOtherUserControllerProvider &&
        other.otherId == otherId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, otherId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<bool> runNotifierBuild(
    covariant FollowOtherUserController notifier,
  ) {
    return notifier.build(
      otherId: otherId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
