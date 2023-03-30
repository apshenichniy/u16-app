// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      id: json['id'] as String,
      username: json['username'] as String,
      profileType: $enumDecode(_$UserProfileTypeEnumMap, json['profile_type']),
      dateOfBirth: DateTime.parse(json['date_of_birth'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'username': instance.username,
    'profile_type': _$UserProfileTypeEnumMap[instance.profileType]!,
    'date_of_birth': instance.dateOfBirth.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  return val;
}

const _$UserProfileTypeEnumMap = {
  UserProfileType.junior: 'junior',
  UserProfileType.coach: 'coach',
  UserProfileType.scout: 'scout',
};
