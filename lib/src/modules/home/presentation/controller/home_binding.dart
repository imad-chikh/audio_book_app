import 'package:get/get.dart';

import '../../data/datasources/home_remote_data_sourse.dart';
import '../../data/repositories/home_repository.dart';
import '../../domain/repositories/base_home_repository.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  final BaseHomeRepository authRepository =
      HomeRepository(HomeRemoteDataSourse());

  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(authRepository));
  }
}
