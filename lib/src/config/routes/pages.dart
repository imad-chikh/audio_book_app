import 'package:audio_book_app/src/modules/welcome/presentation/pages/splash_screen.dart';
import 'package:get/get.dart';

import '../../modules/audio_player/presentation/controllers/book_player_binding.dart';
import '../../modules/audio_player/presentation/pages/book_player_screen.dart';
import '../../modules/auth/presentation/controller/login_binding.dart';
import '../../modules/auth/presentation/controller/sign_up_binding.dart';
import '../../modules/auth/presentation/pages/login_screen.dart';
import '../../modules/auth/presentation/pages/sign_up_screen.dart';
import '../../modules/details/presentation/controllers/details_binding.dart';
import '../../modules/details/presentation/pages/details_screen.dart';
import '../../modules/home/presentation/controller/home_binding.dart';
import '../../modules/home/presentation/pages/home_screen.dart';
import '../../modules/welcome/presentation/controller/onboarding_binding.dart';
import '../../modules/welcome/presentation/controller/splash_binding.dart';
import '../../modules/welcome/presentation/pages/onboarding_screen.dart';
import 'names.dart';

class AppPages {
  static List<GetPage> routes = [
    GetPage(
        name: AppRoutes.Splash,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoutes.Onboarding,
        page: () => const OnboardingScreen(),
        binding: OnboardingBinding()),
    GetPage(
        name: AppRoutes.Home,
        page: () => const HomeScreen(),
        binding: HomeBinding()),
    GetPage(
      name: AppRoutes.Details,
      page: () => const DetailsScreen(),
      binding: DetailsBinding(),
    ),
    GetPage(
        name: AppRoutes.BookPlayer,
        page: () => const BookPlayerScreen(),
        binding: BookPlayerBinding(),
        transition: Transition.downToUp),
    GetPage(
        name: AppRoutes.Login,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.SignUp,
        page: () => const SignUpScreen(),
        transition: Transition.leftToRightWithFade,
        binding: SignUpBinding())
  ];
}
