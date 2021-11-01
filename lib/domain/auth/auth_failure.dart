import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser() = _CancelledByUser;
  const factory AuthFailure.serverError() = _ServerError;
  const factory AuthFailure.userNotFound() = _UserNotFound;
  const factory AuthFailure.wroingPassword() = _WroingPassword;
  const factory AuthFailure.emailAlreadyInUse() = _EmailAlreadyInUse;
}
