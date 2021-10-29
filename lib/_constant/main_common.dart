import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_login/injection.dart';
import 'package:flutter_social_login/presentation/app_widget.dart';
import 'package:injectable/injectable.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureInjection(Environment.prod);

  runApp(const AppWidget());
}
