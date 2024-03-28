// ignore_for_file: unused_local_variable

import 'package:chat_app/View/after_auth/HomeView.dart';
import 'package:chat_app/View/auth/LoginView.dart';
import 'package:chat_app/View/auth/RegisterView.dart';
import 'package:chat_app/View/chat/ChatNavView.dart';
import 'package:chat_app/View/check_connectivity_view.dart';
import 'package:chat_app/View/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case SplashView.viewID:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case CheckConnectivityView.viewID:
        return MaterialPageRoute(builder: (_) => CheckConnectivityView());
      case LoginView.viewID:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RegisterView.viewID:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case HomeView.viewID:
        return MaterialPageRoute(builder: (_) => HomeView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
