import 'dart:async';
import 'dart:developer';

import 'package:chat_app/Res/colors.dart';
import 'package:chat_app/Res/constants.dart';
import 'package:chat_app/View/after_auth/HomeView.dart';
import 'package:chat_app/View/auth/LoginView.dart';
import 'package:chat_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatefulWidget {
  static const String viewID = "SplashView";
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        print(state);
        await Future.delayed(const Duration(seconds: 3));
        if (state is AuthSignedIn) {
          Navigator.pushNamedAndRemoveUntil(
              context, HomeView.viewID, (route) => false);
        } else if (state is AuthNotSignedIn) {
          Navigator.pushNamedAndRemoveUntil(
              context, LoginView.viewID, (route) => false);
        }
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const SizedBox(
                height: 20,
              ),
              const Icon(
                Icons.chat,
                size: 70,
                color: AppColor.blue,
              ),
              Text(
                appName,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: AppColor.blue),
              ),
              const Spacer(),
              const CircularProgressIndicator(),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
