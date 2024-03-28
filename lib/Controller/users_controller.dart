import 'dart:developer';

import 'package:chat_app/Controller/user_auth_controller.dart';
import 'package:chat_app/Model/UserModel.dart';
import 'package:chat_app/Services/users_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  final userAuthController = Get.find<UserAuthController>();
  final UsersServices _usersServices = UsersServices();

  var allUsersLoading = false.obs;
  bool get getAllUsersLoading => allUsersLoading.value;
  changeAllUsersLoading(bool val) {
    allUsersLoading(val);
  }

  var chatUsersLoading = false.obs;
  bool get getChatUsersLoading => allUsersLoading.value;
  changeChatUsersLoading(bool val) {
    chatUsersLoading(val);
  }

  List<UserModel> allUsersList = [];

  Future<List<UserModel>> getAllUsersList() async {
    log('runn all users getting function');
    try {
      changeAllUsersLoading(true);
      allUsersList = await _usersServices
          .getAllUsers(userAuthController.authUser.uid.toString());
      return allUsersList;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      changeAllUsersLoading(false);
    }
  }
}
