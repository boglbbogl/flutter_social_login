part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState.initial() = _Initial;
  factory AuthState.authenticated() = _Authenticated;
  factory AuthState.unAuthenticated() = _UnAuthenticated;
}
