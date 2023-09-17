import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';
import '../repositories/base_auth_repository.dart';

class LoginUserByEmailAndPasswordUseCase {
  final BaseAuthRepository repository;
  LoginUserByEmailAndPasswordUseCase(this.repository);

  Future<Either<Failure, User>> call(String email, String password) async {
    final result =
        await repository.loginUserByEmailAndPassword(email, password);
    return result;
  }
}
