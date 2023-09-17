import 'package:audio_book_app/src/core/error/failures.dart';
import 'package:audio_book_app/src/modules/home/data/datasources/home_remote_data_sourse.dart';

import 'package:audio_book_app/src/modules/home/domain/entities/book.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/base_home_repository.dart';

class HomeRepository implements BaseHomeRepository {
  final BaseHomeRemoteDataSource homeRemoteDataSource;
  HomeRepository(this.homeRemoteDataSource);

//get recommended books
  @override
  Future<Either<Failure, List<Book>>> getRecommendedBooks() async {
    try {
      final result = await homeRemoteDataSource.getRecommendedBooks();
      print("repo right  :  $result");
      return Right(result);
    } catch (e) {
      print("repo left  :  $e");
      return Left(ServerFailure(e.toString()));
    }
  }
  // get best seller books
  @override
  Future<Either<Failure, List<Book>>> getBestSellerBooks()async {
     try {
      final result = await homeRemoteDataSource.getBestSellerBooks();
      print("repo right  :  $result");
      return Right(result);
    } catch (e) {
      print("repo left  :  $e");
      return Left(ServerFailure(e.toString()));
    }
  }
}
