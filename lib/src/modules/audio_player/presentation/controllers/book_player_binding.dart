import 'package:get/get.dart';

import 'book_play_controller.dart';

class BookPlayerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<BookPlayerController>(BookPlayerController());
  }
}
