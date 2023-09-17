import 'package:audio_book_app/src/core/error/exeptions.dart';
import 'package:audio_book_app/src/modules/auth/domain/repositories/base_auth_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepository extends BaseAuthRepository {
  AuthRepository(this.remoteAuthDataSource);
  final BaseAuthRemoteDataSource remoteAuthDataSource;

  @override
  Future<Either<Failure, User>> loginUserByEmailAndPassword(
    String userEmail,
    String userPassword,
  ) async {
    try {
      final result = await remoteAuthDataSource.loginUserByEmailAndPassword(
          userEmail, userPassword);
      print("result: $result");
      return Right(result);
    } on ServerException catch (failure) {
      print("error repository level");
      // print("error: ${failure.errorMessageModel.statusMessage}");
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  // @override
  // Future loginUserByFacebookAccount() {
  //   throw UnimplementedError();
  // }

  // @override
  // Future loginUserByGoogleAccount() {
  //   throw UnimplementedError();
  // }

  // @override
  // Future loginUserByTwitterAccount() {
  //   throw UnimplementedError();
  // }

  // @override
  // Future sendEmailVerificationCode() {
  //   throw UnimplementedError();
  // }

  // @override
  // Future sendPasswordResetEmail() {
  //   throw UnimplementedError();
  // }

  // @override
  // Future signUpUserWithEmailAndPassword() {
  //   throw UnimplementedError();
  // }
}
