import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/book.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, List<Book>>> getRecommendedBooks();

  Future<Either<Failure, List<Book>>> getBestSellerBooks();
}
