import 'package:chat_app/Controller/user_auth_controller.dart';
import 'package:chat_app/Model/UserModel.dart';
import 'package:chat_app/Res/colors.dart';
import 'package:chat_app/Res/constants.dart';
import 'package:chat_app/Res/utils.dart';
import 'package:chat_app/View/auth/LoginView.dart';
import 'package:chat_app/View/chat/ChatNavView.dart';
import 'package:chat_app/View/check_connectivity_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  static const String viewID = "HomeView";
  UserModel userData = UserModel();
  final userAuthController = Get.find<UserAuthController>();
  @override
  Widget build(BuildContext context) {
    userData = userAuthController.authUser;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          appName,
        ),
        actions: [
          IconButton(
              onPressed: () {
                userData = UserModel();
                Get.offAndToNamed(CheckConnectivityView.viewID);
                userAuthController.logoutUser();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: ChatNavView(),
    ));
  }
}
