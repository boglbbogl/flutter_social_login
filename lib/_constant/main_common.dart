import 'package:flutter/material.dart';
import 'package:flutter_social_login/injection.dart';
import 'package:flutter_social_login/presentation/app_widget.dart';
import 'package:injectable/injectable.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  runApp(const AppWidget());
}
