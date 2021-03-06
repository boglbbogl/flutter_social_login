import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_social_login/domain/auth/auth_failure.dart';
import 'package:flutter_social_login/domain/auth/i_auth_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

@Injectable()
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;
  SignInFormBloc(
    this._authFacade,
  ) : super(SignInFormState.initial());

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {},
      signInWithGooglePressed: (e) async* {
        yield state.copyWith(isSubmitting: true, authFailureOrSuccess: null);
        final result = await _authFacade.signInWithGoogle();
        yield state.copyWith(isSubmitting: false, authFailureOrSuccess: result);
      },
    );
  }
}
