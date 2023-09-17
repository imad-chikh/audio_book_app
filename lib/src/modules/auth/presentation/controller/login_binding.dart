import 'package:audio_book_app/src/modules/auth/data/datasources/auth_remote_data_source.dart';
import 'package:audio_book_app/src/modules/auth/data/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../domain/repositories/base_auth_repository.dart';
import 'login_controller.dart';

class LoginBinding implements Bindings {
  final BaseAuthRepository authRepository =
      AuthRepository(AuthRemoteDataSource(FirebaseAuth.instance));

  @override
  void dependencies() {
    Get.put<LoginController>(LoginController(authRepository));
  }
}
