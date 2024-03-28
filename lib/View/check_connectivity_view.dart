import 'package:chat_app/Controller/in_connectivity_controller.dart';
import 'package:chat_app/Controller/user_auth_controller.dart';
import 'package:chat_app/Controller/users_controller.dart';
import 'package:chat_app/Res/colors.dart';
import 'package:chat_app/Res/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckConnectivityView extends StatelessWidget {
  static const String viewID = 'CheckConnectivityView';
  CheckConnectivityView({super.key});

  ConnectivityController checkConnectivityController =
      Get.put(ConnectivityController());
  UserAuthController userAuthController = Get.put(UserAuthController());
  UsersController usersController = Get.put(UsersController());

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    checkConnectivityController.checkConnection();
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 11.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.public_off,
                color: AppColor.dark,
                size: 150,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'No Internet Connection',
                style: textTheme.headlineSmall!.copyWith(color: AppColor.dark),
              ),
              const SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Open wifi or cellular data that has internet.',
                  textAlign: TextAlign.center,
                  style: textTheme.titleMedium!.copyWith(color: AppColor.error),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: () {
                  checkConnectivityController.checkConnection();
                },
                backgroundColor: AppColor.dark,
                child: const Icon(Icons.refresh),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
