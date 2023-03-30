import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockGoTrueClient extends Mock implements GoTrueClient {}

class MockUser extends Mock implements User {}

class MockFunctionsClient extends Mock implements FunctionsClient {}

class MockFunctionResponse extends Mock implements FunctionResponse {}

class MockAuthResponse extends Mock implements AuthResponse {}
