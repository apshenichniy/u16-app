import 'package:auto_route/auto_route.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/auth/auth.dart';

extension AuthenticationStateRoute on AuthenticationState {
  PageRouteInfo get route => when(
        authenticated: (_) => const HomeRouter(),
        unauthenticated: SignInRoute.new,
        ageCheckRequired: AgeCheckRoute.new,
        userProfileRequired: ChooseProfileTypeRoute.new,
        waitingForConsent: VerifyConsentRoute.new,
      );
}
