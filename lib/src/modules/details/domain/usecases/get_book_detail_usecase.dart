import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/book_detail.dart';
import '../repositories/base_details_repository.dart';

class GetBookDetailUseCase {
  final BaseDetailsRepository bookdetailRepository;

  GetBookDetailUseCase(this.bookdetailRepository);

  Future<Either<Failure, BookDetail>> execute(String id) async {
    return await bookdetailRepository.getBookDetails(id);
  }
}
