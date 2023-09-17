import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/book_detail.dart';

abstract class BaseDetailsRepository{

  Future<Either<Failure,BookDetail>> getBookDetails(String bookId);

  // Future<Either<Failure,Review>> getBookReviews(String bookId);

  // Future<Either<Failure,Review>> addBookReview(String bookId,Review review);

  // Future<Either<Failure,Review>> updateBookReview(String bookId,Review review);

  // Future<Either<Failure,Review>> deleteBookReview(String bookId,Review review);

  
}