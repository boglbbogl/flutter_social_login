import 'package:bloc/bloc.dart';
import 'package:flutter_social_login/domain/auth/i_auth_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;
  AuthBloc(
    this._authFacade,
  ) : super(AuthState.initial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(
      signedOut: (e) async* {
        await _authFacade.signOut();
        yield AuthState.unAuthenticated();
      },
      authCheckRequested: (e) async* {
        final userOption = await _authFacade.getSignInUser();
        print(userOption);
        if (userOption != null) {
          yield AuthState.authenticated();
        } else {
          yield AuthState.unAuthenticated();
        }
      },
    );
  }
}
