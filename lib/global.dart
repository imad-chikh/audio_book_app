import 'package:audio_book_app/src/modules/auth/data/datasources/auth_remote_data_source.dart';
import 'package:audio_book_app/src/modules/auth/data/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Global {
  //
  static Future init() async {
    Get.lazyPut(() =>
        AuthRepository(AuthRemoteDataSource(FirebaseAuth as FirebaseAuth)));
  }
}
