part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.started() = _Started;
  const factory SignInFormEvent.signInWithGoogle() = _SignInWithGoogle;
}