// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

import 'application/sign_in_form_bloc.dart' as _i7;
import 'domain/i_auth_facade.dart' as _i5;
import 'infrasture/auth_facade.dart' as _i6;
import 'infrasture/firebase_injection_module.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectionModule = _$FirebaseInjectionModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectionModule.firebaseAuth);
  gh.lazySingleton<_i4.GoogleSignIn>(
      () => firebaseInjectionModule.googleSignIn);
  gh.lazySingleton<_i5.IAuthFacade>(
      () => _i6.AuthFacade(get<_i4.GoogleSignIn>(), get<_i3.FirebaseAuth>()));
  gh.factory<_i7.SignInFormBloc>(() => _i7.SignInFormBloc());
  return get;
}

class _$FirebaseInjectionModule extends _i8.FirebaseInjectionModule {}
