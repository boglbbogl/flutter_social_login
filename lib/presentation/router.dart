import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_login/presentation/main_page.dart';
import 'package:flutter_social_login/presentation/sign_in_page.dart';
import 'package:flutter_social_login/presentation/splash_page.dart';
import 'package:injectable/injectable.dart';

Handler splashRouteHandler = Handler(handlerFunc: (
  BuildContext? context,
  Map<String, List<String>> params,
) {
  return SplashPage();
});
Handler signInRouteHandler = Handler(handlerFunc: (
  BuildContext? context,
  Map<String, List<String>> params,
) {
  return SignInPage();
});
Handler mainRouteHandler = Handler(handlerFunc: (
  BuildContext? context,
  Map<String, List<String>> params,
) {
  return MainPage();
});

class Routes {
  static String signIn = "/signIn";
  static String main = "/main";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc: (
      BuildContext? context,
      Map<String, List<String>> params,
    ) {
      return const Center(
        child: Text("Not Found~!"),
      );
    });
    router.define(
      "/",
      handler: splashRouteHandler,
    );
    router.define(
      "/signIn",
      handler: signInRouteHandler,
      transitionType: TransitionType.cupertino,
    );
    router.define(
      "/main",
      handler: mainRouteHandler,
      transitionType: TransitionType.cupertino,
    );
  }
}

class $AppRouter {}
