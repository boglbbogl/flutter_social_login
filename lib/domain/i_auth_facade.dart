import 'package:dartz/dartz.dart';
import 'package:flutter_social_login/domain/auth_failure.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Map<String, String?>>> signInWithGoogle();
}
