import 'package:audio_book_app/src/modules/details/domain/entities/book_detail.dart';
import 'package:get/get.dart';

import '../../domain/repositories/base_details_repository.dart';
import '../../domain/usecases/get_book_detail_usecase.dart';

class DetailsController extends GetxController {
  final BaseDetailsRepository detailsRepository;
  DetailsController(this.detailsRepository);
  //get arguments from previous screen
  // final BookDetail bookDetail = Get.arguments;

  late BookDetail bookDetail;

  //get book details by id
  Future getBookDetailsById(String bookId) async {
    final result =
        await GetBookDetailUseCase(detailsRepository).execute(bookId);
    result.fold((failure) => print("error: $failure"), (right) {
      bookDetail = right;
      print("$bookDetail");
    });
    print("controller : $bookDetail");
  }

  @override
  void onInit() async {
    print("get book details by id");
    print("book id : ${Get.arguments[0]}");
    await getBookDetailsById(Get.arguments[0]);
    super.onInit();
  }

  @override
  void onClose() {
    bookDetail;
    super.onClose();
  }
}
