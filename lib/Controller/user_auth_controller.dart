import 'dart:developer';

import 'package:chat_app/Model/UserModel.dart';
import 'package:chat_app/Res/colors.dart';
import 'package:chat_app/Res/utils.dart';
import 'package:chat_app/Services/auth_services.dart';
import 'package:chat_app/View/after_auth/HomeView.dart';
import 'package:chat_app/View/check_connectivity_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAuthController extends GetxController {
  final AuthServices _authServices = AuthServices();
  UserModel authUser = UserModel();

  var registerLoading = false.obs;
  bool get getRegisterLoading => registerLoading.value;
  changeRegisterLoading(bool val) {
    registerLoading(val);
  }

  final loginLoading = false.obs;
  bool get getLoginLoading => loginLoading.value;
  changeLoginLoading(bool val) {
    loginLoading(val);
  }

  Future<UserModel> loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty && email.isEmail) {
        changeLoginLoading(true);
        authUser = await _authServices.loginUser(email, password);
        Get.offAndToNamed(CheckConnectivityView.viewID);
        return authUser;
      } else {
        throw Exception('Fill all fields correctly');
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      changeLoginLoading(false);
    }
  }

  Future<UserModel> registerUser(String username, String email, String password,
      String confirmPassword) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          confirmPassword.isNotEmpty &&
          email.isEmail) {
        if (password == confirmPassword) {
          changeRegisterLoading(true);
          await _authServices.registerUser(username, email, password);
          _authServices.logoutUser();
          Get.offAndToNamed(CheckConnectivityView.viewID);
          return authUser;
        } else {
          throw Exception('Passwords didnt matched');
        }
      } else {
        throw Exception('Fill all fields correctly');
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      changeRegisterLoading(false);
    }
  }

  logoutUser() async {
    authUser = UserModel();
    _authServices.logoutUser();
  }
}
