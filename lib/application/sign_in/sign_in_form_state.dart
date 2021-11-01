part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  factory SignInFormState({
    required bool isSubmitting,
    required Either<AuthFailure, Unit>? authFailureOrSuccess,
  }) = _SignInFormState;
  factory SignInFormState.initial() => SignInFormState(
        isSubmitting: false,
        authFailureOrSuccess: null,
      );
}
