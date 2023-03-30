import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:u16/src/app.dart';
import 'package:u16/src/core/providers/core_providers.dart';
import 'package:u16/src/features/auth/auth.dart';

import 'mocks.dart';

void main() {
  testWidgets('it starts with splash screen', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: App(),
      ),
    );
    await tester.pump();

    expect(find.byType(InitialSplashPage), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Logging in...'), findsOneWidget);
  });

  testWidgets('if no supabase user it routes to the Sign In page',
      (tester) async {
    final mockSupabaseClient = MockSupabaseClient();
    final mockGoTrueClient = MockGoTrueClient();
    when(() => mockSupabaseClient.auth).thenAnswer((_) => mockGoTrueClient);
    when(() => mockGoTrueClient.currentUser).thenAnswer((_) => null);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          supabaseClientProvider.overrideWithValue(mockSupabaseClient),
        ],
        child: const App(),
      ),
    );

    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.byType(SignInPage), findsOneWidget);
    expect(find.text('Sign up with email'), findsOneWidget);

    await tester.tap(find.text('Sign up with email'));
    await tester.pumpAndSettle();

    expect(find.byType(SignUpWithEmailPage), findsOneWidget);
  });

  testWidgets('it routes to Age Check page if no registered user',
      (tester) async {
    final mockSupabaseClient = MockSupabaseClient();
    final mockGoTrueClient = MockGoTrueClient();
    final mockUser = MockUser();
    final mockFunctionsClient = MockFunctionsClient();
    final mockFunctionResponse = MockFunctionResponse();

    when(() => mockSupabaseClient.auth).thenReturn(mockGoTrueClient);
    when(() => mockGoTrueClient.currentUser).thenReturn(mockUser);
    when(() => mockSupabaseClient.functions).thenReturn(mockFunctionsClient);
    when(
      () => mockFunctionsClient.invoke(
        'authenticate',
        body: {},
      ),
    ).thenAnswer((_) => Future.value(mockFunctionResponse));
    when(() => mockFunctionResponse.data)
        .thenReturn({'auth_state': 'ageCheckRequired'});
    when(() => mockFunctionResponse.status).thenReturn(200);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          supabaseClientProvider.overrideWithValue(mockSupabaseClient),
        ],
        child: const App(),
      ),
    );

    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.byType(AgeCheckPage), findsOneWidget);
  });

  testWidgets(
      'it routes to Verify Consent page if no registered user and consent '
      'request found', (tester) async {
    final mockSupabaseClient = MockSupabaseClient();
    final mockGoTrueClient = MockGoTrueClient();
    final mockUser = MockUser();
    final mockFunctionsClient = MockFunctionsClient();
    final mockFunctionResponse = MockFunctionResponse();

    when(() => mockSupabaseClient.auth).thenReturn(mockGoTrueClient);
    when(() => mockGoTrueClient.currentUser).thenReturn(mockUser);
    when(() => mockSupabaseClient.functions).thenReturn(mockFunctionsClient);
    when(
      () => mockFunctionsClient.invoke(
        'authenticate',
        body: {},
      ),
    ).thenAnswer((_) => Future.value(mockFunctionResponse));
    when(() => mockFunctionResponse.data)
        .thenReturn({'auth_state': 'waitingForConsent'});
    when(() => mockFunctionResponse.status).thenReturn(200);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          supabaseClientProvider.overrideWithValue(mockSupabaseClient),
        ],
        child: const App(),
      ),
    );

    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.byType(VerifyConsentPage), findsOneWidget);
  });
}
