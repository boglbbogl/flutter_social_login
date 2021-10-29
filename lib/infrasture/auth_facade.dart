import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social_login/domain/auth_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_social_login/domain/i_auth_facade.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAuthFacade)
class AuthFacade implements IAuthFacade {
  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _firebaseAuth;

  AuthFacade(
    this._googleSignIn,
    this._firebaseAuth,
  );
  @override
  Future<Either<AuthFailure, Map<String, String?>>> signInWithGoogle() async {
    try {
      final user = await _googleSignIn.signIn();
      if (user == null) {
        return left(const AuthFailure.cancelledByUser());
      }
      final authentication = await user.authentication;
      final authCredential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken,
      );

      final firstName = user.displayName;
      final url = user.photoUrl;
      return _firebaseAuth
          .signInWithCredential(authCredential)
          .then((r) => right({
                'firstName': firstName,
                'photoUrl': url,
              }));
    } on PlatformException catch (e) {
      print('error : $e');
      return left(const AuthFailure.serverError());
    }
  }
}
