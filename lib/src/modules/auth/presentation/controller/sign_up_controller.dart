import 'package:get/get.dart';

import '../../domain/repositories/base_auth_repository.dart';

class SignUpController extends GetxController {
  final BaseAuthRepository authRepository;
  SignUpController(this.authRepository);
}
