// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$demoHash() => r'3f71ce78a1fdf256224a5a65feac9f5b3c7b0a80';

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

typedef DemoRef = AutoDisposeProviderRef<String>;

/// See also [demo].
@ProviderFor(demo)
const demoProvider = DemoFamily();

/// See also [demo].
class DemoFamily extends Family<String> {
  /// See also [demo].
  const DemoFamily();

  /// See also [demo].
  DemoProvider call({
    required T value,
  }) {
    return DemoProvider(
      value: value,
    );
  }

  @override
  DemoProvider getProviderOverride(
    covariant DemoProvider provider,
  ) {
    return call(
      value: provider.value,
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
  String? get name => r'demoProvider';
}

/// See also [demo].
class DemoProvider extends AutoDisposeProvider<String> {
  /// See also [demo].
  DemoProvider({
    required this.value,
  }) : super.internal(
          (ref) => demo(
            ref,
            value: value,
          ),
          from: demoProvider,
          name: r'demoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$demoHash,
          dependencies: DemoFamily._dependencies,
          allTransitiveDependencies: DemoFamily._allTransitiveDependencies,
        );

  final T value;

  @override
  bool operator ==(Object other) {
    return other is DemoProvider && other.value == value;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, value.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
