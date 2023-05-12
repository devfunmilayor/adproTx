import 'package:adpro/config/core/route/route.dart';
import 'package:adpro/features/auth/presentation/view/auth/auth_view.dart';
import 'package:adpro/features/auth/presentation/view/auth/signin.dart';
import 'package:adpro/features/auth/presentation/view/onboarding/onboarding.dart';
import 'package:adpro/features/splash.dart';
import 'package:auto_route/auto_route.dart';

@CustomAutoRouter(
    replaceInRouteName: 'Page,Route',
    transitionsBuilder: buildTransitions,
    durationInMilliseconds: 10,
    routes: <CustomRoute>[
      CustomRoute(
        page: SplashScreen,
        initial: true,
      ),
      CustomRoute(
        page: OnboardingView,
        path: AdPro.ONBOARDING_ROUTE,
      ),
      CustomRoute(
        page: AuthMainView,
        path: AdPro.AUTH_ROUTE,
      ),
      CustomRoute(
        page: SignIn,
        path: AdPro.SIGN_IN_ROUTE,
      ),
    ])
class $AdproofRouter {}
