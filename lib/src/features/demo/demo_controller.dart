import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'demo_controller.g.dart';

@riverpod
String demo<T>(DemoRef ref, {required T value}) {
  return 'test';
}
