import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/book.dart';
import '../repositories/base_home_repository.dart';

class GetBestSellerBooksUseCase {
  final BaseHomeRepository repository;
  GetBestSellerBooksUseCase(this.repository);

  Future<Either<Failure, List<Book>>> call() async {
    final result = await repository.getBestSellerBooks();
    print("usecase :  $result");
    return result;
  }
}
