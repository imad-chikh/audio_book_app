import 'package:get/get.dart';

import '../../data/datasources/details_remote_data_source.dart';
import '../../data/repositories/details_repository.dart';
import '../../domain/repositories/base_details_repository.dart';
import 'details_controller.dart';

class DetailsBinding implements Bindings {
  final BaseDetailsRepository detailsRepository =
      DetailsRepository(DetailsRemoteDataSource());

  @override
  void dependencies() {
    Get.put<DetailsController>(DetailsController(detailsRepository));
  }
}
