import 'package:audio_book_app/src/modules/auth/domain/repositories/base_auth_repository.dart';
import 'package:audio_book_app/src/modules/auth/domain/usecases/login_user_by_email_and_passwordusecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final BaseAuthRepository authRepository;
  LoginController(this.authRepository);

  // final LoginUserByEmailAndPasswordUseCase loginUserByEmailAndPasswordUseCase;
  // FirebaseAuth auth = FirebaseAuth.instance;
  // BaseAuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSource(auth);
  // BaseAuthRepository authRepository = AuthRepository(authRemoteDataSource);

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void login(email, password) async {
    if (loginFormKey.currentState!.validate()) {
      isLoading = true;
      update(["login_button"]);
      final result = await LoginUserByEmailAndPasswordUseCase(authRepository)
          .call(email, password);
      result.fold((failure) => print("Something went wrong"),
          (r) => print("seccess  $r"));
      isLoading = false;
      update(["login_button"]);
    }
  }
}
