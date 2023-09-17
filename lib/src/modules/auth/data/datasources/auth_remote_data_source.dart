import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

abstract class BaseAuthRemoteDataSource {
  BaseAuthRemoteDataSource(FirebaseAuth auth);

  Future<UserModel> loginUserByEmailAndPassword(
      String userEmail, String userPassword);

  // Future<dynamic> loginUserByGoogleAccount();

  // Future<dynamic> loginUserByFacebookAccount();

  // Future<dynamic> loginUserByTwitterAccount();

  // Future<dynamic> signUpUserWithEmailAndPassword();

  // Future<dynamic> sendPasswordResetEmail();

  // Future<dynamic> sendEmailVerificationCode();
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  AuthRemoteDataSource(this.firebaseAuth) : super(firebaseAuth);
  final FirebaseAuth firebaseAuth;

  @override
  Future<UserModel> loginUserByEmailAndPassword(userEmail, userPassword) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: userEmail, password: userPassword);
      print("user id: ${userCredential.user!.uid}");
      return UserModel(
          id: userCredential.user!.uid,
          email: userCredential.user?.email,
          name: userCredential.user?.displayName,
          avatar: userCredential.user?.photoURL);
    } on FirebaseAuthException catch (failure) {
      print("error datasourse level ");
      print("====$failure ====");
      // print("error code: $FirebaseAuthException");
      rethrow;
    }
  }
}
