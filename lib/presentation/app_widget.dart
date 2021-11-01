import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_login/application/auth/auth_bloc.dart';
import 'package:flutter_social_login/application/sign_in/sign_in_form_bloc.dart';
import 'package:flutter_social_login/injection.dart';
import 'package:flutter_social_login/presentation/router.dart';
import 'application.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<SignInFormBloc>()),
        BlocProvider(
            create: (context) =>
                getIt<AuthBloc>()..add(AuthEvent.authCheckRequested())),
      ],
      child: MaterialApp(
        // home: MainPage(),
        onGenerateRoute: Application.router!.generator,
      ),
    );
  }
}
