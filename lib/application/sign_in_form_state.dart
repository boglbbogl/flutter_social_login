part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  factory SignInFormState({
    required bool isSubmitted,
  }) = _SignInFormState;
  factory SignInFormState.initial() => SignInFormState(
        isSubmitted: false,
      );
}
