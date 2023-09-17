import 'package:audio_book_app/src/modules/details/domain/repositories/base_details_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/book_detail.dart';
import '../datasources/details_remote_data_source.dart';

class DetailsRepository implements BaseDetailsRepository {
  final BaseDetailsRemoteDataSource remoteDetailsDataSource;

  DetailsRepository(this.remoteDetailsDataSource);
  @override
  Future<Either<Failure, BookDetail>> getBookDetails(String bookId) async {
    try {
      final result = await remoteDetailsDataSource.getBookDetails(bookId);
      return Right(result);
    } catch (e) {
      print("repository : $e");
      return Left(ServerFailure(e.toString()));
    }
  }
}
