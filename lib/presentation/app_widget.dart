import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_login/application/sign_in_form_bloc.dart';
import 'package:flutter_social_login/injection.dart';
import 'package:flutter_social_login/presentation/sign_in_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<SignInFormBloc>()),
      ],
      child: MaterialApp(
        home: SignInPage(),
      ),
    );
  }
}
