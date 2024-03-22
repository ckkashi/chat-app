// ignore_for_file: unused_local_variable

import 'package:chat_app/View/auth/LoginView.dart';
import 'package:chat_app/View/auth/RegisterView.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case LoginView.viewID:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RegisterView.viewID:
        return MaterialPageRoute(builder: (_) => RegisterView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
