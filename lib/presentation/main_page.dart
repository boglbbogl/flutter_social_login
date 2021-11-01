import 'package:flutter/material.dart';
import 'package:flutter_social_login/application/auth/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: () {
          context.read<AuthBloc>().add(const AuthEvent.signedOut());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Container(
            height: size.height * 0.08,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: Colors.black),
            child: Center(
              child: Text(
                'Log Out !!',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: const Text('Login Sucess'),
      ),
    );
  }
}
