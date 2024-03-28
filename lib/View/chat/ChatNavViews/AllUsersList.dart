import 'package:chat_app/Controller/users_controller.dart';
import 'package:chat_app/Model/UserModel.dart';
import 'package:chat_app/Res/colors.dart';
import 'package:chat_app/bloc/users_bloc/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllUsersList extends StatelessWidget {
  AllUsersList({super.key});

  final usersController = Get.find<UsersController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(builder: (controller) {
      return FutureBuilder(
        future: usersController.getAllUsersList(),
        builder: (context, snapshot) {
          return controller.getAllUsersLoading
              ? const Center(
                  child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                ))
              : Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      UserModel current = snapshot.data![index];
                      return Card(
                        color: AppColor.light,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: AppColor.light,
                            foregroundImage: NetworkImage(current.profile == ''
                                ? 'https://www.pngkey.com/png/full/72-729716_user-avatar-png-graphic-free-download-icon.png'
                                : current.profile.toString()),
                          ),
                          title: Text(current.username.toString()),
                          subtitle: Text(current.email.toString()),
                        ),
                      );
                    },
                  ),
                );
        },
      );
    });
  }
}
