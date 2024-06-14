import 'package:get/get.dart';

import '../modules/bottom_nav/bindings/bottom_nav_binding.dart';
import '../modules/bottom_nav/views/bottom_nav_view.dart';
import '../modules/detail_magic_card/bindings/detail_magic_card_binding.dart';
import '../modules/detail_magic_card/views/detail_magic_card_view.dart';
import '../modules/detail_module/bindings/detail_module_binding.dart';
import '../modules/detail_module/views/detail_module_view.dart';
import '../modules/detail_molecule/bindings/detail_molecule_binding.dart';
import '../modules/detail_molecule/views/detail_molecule_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/leaderboard/bindings/leaderboard_binding.dart';
import '../modules/leaderboard/views/leaderboard_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/modul_tersedia/bindings/modul_tersedia_binding.dart';
import '../modules/modul_tersedia/views/modul_tersedia_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/permission_camera_scanner/bindings/permission_camera_scanner_binding.dart';
import '../modules/permission_camera_scanner/views/permission_camera_scanner_view.dart';
import '../modules/quiz_question/bindings/quiz_question_binding.dart';
import '../modules/quiz_question/views/quiz_question_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/scanner/bindings/scanner_binding.dart';
import '../modules/scanner/views/scanner_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/splash_1/bindings/splash_1_binding.dart';
import '../modules/splash_1/views/splash_1_view.dart';
import '../modules/splash_2/bindings/splash_2_binding.dart';
import '../modules/splash_2/views/splash_2_view.dart';
import '../modules/submit_page/bindings/submit_page_binding.dart';
import '../modules/submit_page/views/submit_page_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_1;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_1,
      page: () => const Splash1View(),
      binding: Splash1Binding(),
    ),
    GetPage(
      name: _Paths.SPLASH_2,
      page: () => const Splash2View(),
      binding: Splash2Binding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.SCANNER,
      page: () => const ScannerView(),
      binding: ScannerBinding(),
    ),
    GetPage(
      name: _Paths.PERMISSION_CAMERA_SCANNER,
      page: () => const PermissionCameraScannerView(),
      binding: PermissionCameraScannerBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.MODUL_TERSEDIA,
      page: () => const ModulTersediaView(),
      binding: ModulTersediaBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_MODULE,
      page: () => const DetailModuleView(),
      binding: DetailModuleBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV,
      page: () => const BottomNavView(),
      binding: BottomNavBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_MOLECULE,
      page: () => const DetailMoleculeView(),
      binding: DetailMoleculeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_MAGIC_CARD,
      page: () => const DetailMagicCardView(),
      binding: DetailMagicCardBinding(),
    ),
    GetPage(
      name: _Paths.QUIZ_QUESTION,
      page: () => const QuizQuestionView(),
      binding: QuizQuestionBinding(),
    ),
    GetPage(
      name: _Paths.SUBMIT_PAGE,
      page: () => const SubmitPageView(),
      binding: SubmitPageBinding(),
    ),
    GetPage(
      name: _Paths.LEADERBOARD,
      page: () => const LeaderboardView(),
      binding: LeaderboardBinding(),
    ),
  ];
}
