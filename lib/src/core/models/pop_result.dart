import 'package:freezed_annotation/freezed_annotation.dart';

part 'pop_result.freezed.dart';

@freezed
class PopResult<T> with _$PopResult<T> {
  const factory PopResult.data({required T? value}) = _Data;
  const factory PopResult.cancel() = _Cancel;
}
