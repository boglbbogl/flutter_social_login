import 'package:dartz/dartz.dart';
import 'package:flutter_social_login/domain/auth/auth_failure.dart';
import 'package:flutter_social_login/domain/auth/user.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
  Future<AppUser?> getSignInUser();
}
