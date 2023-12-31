import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paybox/app/modules/auth/bindings/auth_binding.dart';
import 'package:paybox/app/modules/auth/views/login_view.dart';
import 'package:paybox/app/modules/deals/view/deals_details.dart';
import 'package:paybox/app/modules/home/bindings/home_binding.dart';
import 'package:paybox/app/services/auth_service.dart';
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
  GetStorage? _box;
  late String? token;

  Theme1AppPages() {
    _box = GetStorage();
    token = _box!.read('token');
  }

  final authService = Get.find<AuthService>();

  // static String get INITIAL {
  //   final authService = Get.find<AuthService>();
  //   Get.log('  auuuth ${authService.user.value.auth}');
  //   return authService.user.value.auth == true ? Routes.HOMEPAGE : Routes.LOGIN;
  //   // return token == null ? Routes.ONBORDING : Routes.HOMEPAGE;
  // }
  static String get INITIAL {
    final _box = GetStorage();
    final token = _box.read('token');
    return token == null ? Routes.ONBORDING : Routes.HOMEPAGE;
  }

  // static const INITIAL = authService.isAuth ? Routes.HOMEPAGE : Routes.LOGIN;
  static final routes = [
    GetPage(name: Routes.ONBORDING, page: () => OnboardingScreen()),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
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
    GetPage(
      name: Routes.DEALSDETAILS,
      page: () => const DealsDetails(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.DEALSDETAILS,
      page: () => const DealsDetails(),
      binding: HomeBinding(),
    ),
  ];
}
