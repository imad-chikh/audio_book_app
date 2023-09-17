import 'package:audio_book_app/src/modules/auth/presentation/controller/sign_up_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository.dart';
import '../../domain/repositories/base_auth_repository.dart';

class SignUpBinding implements Bindings {
  final BaseAuthRepository authRepository =
      AuthRepository(AuthRemoteDataSource(FirebaseAuth.instance));

  @override
  void dependencies() {
    Get.put<SignUpController>(SignUpController(authRepository));
  }
}
