import 'package:flutter_social_login/domain/auth_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_social_login/domain/i_auth_facade.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAuthFacade)
class AuthFacade implements IAuthFacade {
  @override
  Future<Either<AuthFailure, Map<String, String?>>> signInWithGoogle() {
    throw UnimplementedError();
  }
}
