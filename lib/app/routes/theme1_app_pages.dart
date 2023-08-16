import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:paybox/app/modules/auth/bindings/auth_binding.dart';
import 'package:paybox/app/modules/auth/views/login_view.dart';
import 'package:paybox/app/services/onboarding_screen.dart';

import '../modules/auth/views/sign_up_view.dart';
import '../modules/profile/binding/profile_binding.dart';
import '../modules/profile/view/about_us.dart';
import '../modules/profile/view/privacy_policy.dart';
import '../modules/profile/view/term_condition.dart';
import '../modules/root/binding/root_binding.dart';
import '../modules/root/view/root_view.dart';
import 'app_routes.dart';

class Theme1AppPages {
  static const INITIAL = Routes.HOMEPAGE;
  static final routes = [
    GetPage(name: Routes.ONBORDING, page: () => const OnboardingScreen()),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const SignUpView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.HOMEPAGE,
      page: () => const RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: Routes.PRIVACYPOLICY,
      page: () => const PrivacyPolicy(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.TERMCONDITION,
      page: () => const TermsConditionsPage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.ABOUTUS,
      page: () => const AboutUsPage(),
      binding: ProfileBinding(),
    ),
  ];
}
