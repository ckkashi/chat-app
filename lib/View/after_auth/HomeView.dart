import 'package:chat_app/Model/UserModel.dart';
import 'package:chat_app/Res/colors.dart';
import 'package:chat_app/Res/constants.dart';
import 'package:chat_app/Res/utils.dart';
import 'package:chat_app/View/auth/LoginView.dart';
import 'package:chat_app/View/chat/ChatNavView.dart';
import 'package:chat_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  static const String viewID = "HomeView";
  UserModel userData = UserModel();

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final theme = Theme.of(context);
    authBloc.add(GetUserEvent());
    return SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthGetUser) {
          userData = state.user;
        } else if (state is AuthError) {
          Utils.showSnackBar(context, state.error, AppColor.error);
          Navigator.pushNamedAndRemoveUntil(
            context,
            LoginView.viewID,
            (route) => false,
          );
        } else if (state is AuthUserLogout) {
          Utils.showSnackBar(context, state.message, AppColor.error);
          Navigator.pushNamedAndRemoveUntil(
            context,
            LoginView.viewID,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              appName,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    userData = UserModel();
                    authBloc.add(UserLogoutEvent());
                  },
                  icon: const Icon(Icons.logout))
            ],
          ),
          body: state is! AuthGetUser && userData.uid != null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ChatNavView(),
        );
      },
    ));
  }
}
