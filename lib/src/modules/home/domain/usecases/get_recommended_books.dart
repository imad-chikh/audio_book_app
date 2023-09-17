import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/book.dart';
import '../repositories/base_home_repository.dart';

class GetRecommendedBooksUseCase {
  final BaseHomeRepository repository;
  GetRecommendedBooksUseCase(this.repository);

  Future<Either<Failure, List<Book>>> call() async {
    final result = await repository.getRecommendedBooks();
    print("usecase :  $result");
    return result;
  }
}
