import 'package:audio_book_app/src/config/routes/names.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.Onboarding);
    });
  }
}
