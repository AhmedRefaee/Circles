import 'package:circles/features/auth/forgot_password/presentation/view/forgot_password_page.dart';
import 'package:flutter/material.dart';
import 'package:circles/core/routing/routes.dart';
import 'package:circles/features/auth/auth_landing/presentation/view/auth_landing.dart';
import 'package:circles/features/auth/new_password/presentation/views/new_password_page.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // THIS arguments is to be passed in any screen like this (argument as class name )

    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.authLanding:
        return MaterialPageRoute(builder: (context) => AuthLanding());
      case Routes.forgotPasswordPage:
        return MaterialPageRoute(builder: (context) => ForgotPasswordPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('No route found'))),
        );
    }
  }
}
