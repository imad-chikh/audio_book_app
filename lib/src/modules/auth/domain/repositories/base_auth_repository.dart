import 'package:audio_book_app/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/user.dart';

abstract class BaseAuthRepository {


  Future<Either<Failure, User>> loginUserByEmailAndPassword(
      String userEmail, String userPassword);

  // Future<dynamic> loginUserByGoogleAccount();

  // Future<dynamic> loginUserByFacebookAccount();

  // Future<dynamic> loginUserByTwitterAccount();

  // Future<dynamic> signUpUserWithEmailAndPassword();

  // Future<dynamic> sendPasswordResetEmail();

  // Future<dynamic> sendEmailVerificationCode();
}
