import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:u16/src/core/providers/core_providers.dart';
import 'package:u16/src/features/auth/auth.dart';

part 'users_repository.g.dart';

/// User entity related repository
class UsersRepository {
  // ignore: public_member_api_docs
  UsersRepository({required SupabaseClient supabaseClient})
      : _supabaseClient = supabaseClient;
  final SupabaseClient _supabaseClient;

  /// Find current [AppUser] entity. User must be authenticated,
  /// otherwise [StateError] will be thrown.
  /// If no user profile found returns null.
  Future<AppUser?> get currentUser async {
    final uid = _supabaseClient.auth.currentUser?.id;
    if (uid == null) throw StateError('No authenticated user');

    return findUser(uid);
  }

  Future<AppUser?> findUser(String id) async {
    final json = await _supabaseClient
        .from('app_users')
        .select<Map<String, dynamic>?>()
        .eq('id', id)
        .maybeSingle();

    return json != null ? AppUser.fromJson(json) : null;
  }

  /// Finish onboarding and create a user profile for current user.
  /// [username] - unique username
  /// [dateOfBirth] - date of birth, provided during onboarding
  /// [profileType] - type of user's profile [UserProfileType]
  Future<void> createUserProfile({
    required String username,
    required UserProfileType profileType,
    DateTime? dateOfBirth,
  }) async {
    final uid = _supabaseClient.auth.currentUser?.id;
    if (uid == null) throw StateError('No authenticated user');

    late DateTime actualDateOfBirth;

    if (dateOfBirth == null) {
      // fetch date from consent request
      final response = await _supabaseClient
          .from('consent_requests')
          .select<Map<String, dynamic>?>('date_of_birth')
          .eq('id', uid)
          .maybeSingle();

      if (response == null) {
        throw StateError('No date of birth found for authenticated user.');
      }

      actualDateOfBirth = DateTime.parse(response['date_of_birth'] as String);
    } else {
      actualDateOfBirth = dateOfBirth;
    }

    final user = AppUser(
      id: uid,
      username: username,
      profileType: profileType,
      dateOfBirth: actualDateOfBirth,
    );

    await _supabaseClient.from('app_users').insert(user.toJson());
  }

  Future<AppUser?> findUserByName(String username) async {
    final json = await _supabaseClient
        .from('app_users')
        .select<Map<String, dynamic>?>()
        .eq('username', username)
        .maybeSingle();

    return json != null ? AppUser.fromJson(json) : null;
  }

  Future<List<AppUser>> findAllUsers() async {
    final json =
        await _supabaseClient.from('app_users').select<PostgrestList>();

    return json.map(AppUser.fromJson).toList();
  }
}

@riverpod
UsersRepository usersRepository(UsersRepositoryRef ref) {
  return UsersRepository(supabaseClient: ref.read(supabaseClientProvider));
}
