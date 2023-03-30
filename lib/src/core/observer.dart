import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Observer extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    // ignore: lines_longer_than_80_chars
    log('${provider.name ?? provider.runtimeType}: $previousValue -> $newValue');
  }
}
