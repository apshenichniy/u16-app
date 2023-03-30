import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:u16/src/app.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/auth/auth.dart';

import 'mocks.dart';

void main() {
  testWidgets('it should be able to sign up with email and password',
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

    await tester.tap(find.text('Sign up with email'));
    await tester.pumpAndSettle();

    expect(find.byType(SignUpWithEmailPage), findsOneWidget);

    final emailFieldFinder =
        find.widgetWithText(TextFormField, 'Email address');

    // test invalid email
    await tester.enterText(
      emailFieldFinder,
      'user1user.dev',
    );

    await tester.tap(find.byType(FilledButton));
    await tester.pump();

    expect(find.text('Enter valid email'), findsOneWidget);
    expect(find.text('Password cannot be empty'), findsOneWidget);

    // test clear and reset email field
    await tester.tap(find.byTooltip('Clear email'));
    await tester.pump();

    expect(find.text('Enter valid email'), findsNothing);
    expect(find.text('user1user.dev'), findsNothing);

    // test non-equal passwords
    final passwordFieldFinder = find.widgetWithText(TextFormField, 'Password');
    final confirmFieldFinder =
        find.widgetWithText(TextFormField, 'Confirm password');

    await tester.enterText(passwordFieldFinder, 'user1pass');
    await tester.enterText(confirmFieldFinder, 'user2pass');

    await tester.tap(find.byType(FilledButton));
    await tester.pump();

    expect(find.text('Passwords must be equal'), findsNWidgets(2));

    // test clear passwords
    await tester.tap(find.byTooltip('Clear password'));
    await tester.pump();

    expect(find.text('Passwords must be equal'), findsNothing);

    // test submit form
    final mockAuthResponse = MockAuthResponse();
    when(
      () => mockGoTrueClient.signUp(
        email: 'user1@user.dev',
        password: 'user1pass',
      ),
    ).thenAnswer((_) => Future.value(mockAuthResponse));

    await tester.enterText(emailFieldFinder, 'user1@user.dev');
    await tester.enterText(passwordFieldFinder, 'user1pass');
    await tester.enterText(confirmFieldFinder, 'user1pass');

    await tester.tap(find.byType(FilledButton));
    await tester.pump();

    verify(
      () => mockGoTrueClient.signUp(
        email: 'user1@user.dev',
        password: 'user1pass',
      ),
    ).called(1);
  });
}
