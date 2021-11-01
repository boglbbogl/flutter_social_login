import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_login/application/auth/auth_bloc.dart';
import 'package:flutter_social_login/presentation/application.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        print(state);
        state.map(
          initial: (_) {},
          authenticated: (_) async {
            print('au');
            Application.router?.navigateTo(context, '/main');

            //router
          },
          unAuthenticated: (_) async {
            print('un');

            print(state);
            Application.router?.navigateTo(context, '/signIn');
          },
        );
      },
      child: Scaffold(
        body: Center(child: Text('Splash')),
      ),
    );
  }
}
