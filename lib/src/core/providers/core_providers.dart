import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

part 'core_providers.g.dart';

@riverpod
SupabaseClient supabaseClient(SupabaseClientRef ref) =>
    Supabase.instance.client;
