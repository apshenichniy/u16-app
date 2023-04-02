import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:u16/src/features/auth/auth.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

/// Application user entity
@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required String username,
    required UserProfileType profileType,
    required DateTime dateOfBirth,
    @JsonKey(includeIfNull: false) DateTime? createdAt,
    String? bio,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
