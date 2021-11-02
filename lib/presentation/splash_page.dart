import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_login/application/auth/auth_bloc.dart';
import 'package:flutter_social_login/presentation/application.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {
            Application.router?.navigateTo(context, '/');
          },
          authenticated: (e) async {
            print(e);
            print('로그인');
            Application.router?.navigateTo(context, '/main',
                transition: TransitionType.fadeIn);
            // Navigator.of(context).pop();
          },
          unAuthenticated: (_) async {
            print('로그아웃');

            Application.router?.navigateTo(context, '/signIn',
                transition: TransitionType.fadeIn);
          },
        );
      },
      builder: (context, state) {
        if (state == AuthState.initial()) {
          // context.read<AuthBloc>().add(const AuthEvent.authCheckRequested());
        }
        return Scaffold(
          body: Center(child: Text('Splash')),
        );
      },
    );
  }
}
