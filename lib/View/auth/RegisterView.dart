import 'package:chat_app/Controller/user_auth_controller.dart';
import 'package:chat_app/Res/colors.dart';
import 'package:chat_app/Res/constants.dart';
import 'package:chat_app/Res/utils.dart';
import 'package:chat_app/Res/widgets/expanded_button_blue.dart';
import 'package:chat_app/Res/widgets/form_text_field.dart';
import 'package:chat_app/View/auth/LoginView.dart';
import 'package:chat_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class RegisterView extends StatelessWidget {
  static const String viewID = "RegisterView";
  RegisterView({super.key});

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final usernameFocus = FocusNode();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          appName,
        ),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Already have an account? ',
                style: theme.textTheme.bodyLarge!
                    .copyWith(color: AppColor.blackGrey),
                children: [
                  TextSpan(
                      style: TextStyle(color: AppColor.blue),
                      text: 'Login',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            LoginView.viewID,
                            (route) => false,
                          );
                        }),
                ])),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    registerString,
                    textScaleFactor: 0.9,
                    style: theme.textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.w500, color: AppColor.blue),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FormTextField(
                    title: 'Username',
                    controller: usernameController,
                    node: usernameFocus,
                    password: false),
                const SizedBox(
                  height: 6,
                ),
                FormTextField(
                    title: 'Email Address',
                    controller: emailController,
                    node: emailFocus,
                    password: false),
                const SizedBox(
                  height: 6,
                ),
                FormTextField(
                    title: 'Password',
                    controller: passwordController,
                    node: passwordFocus,
                    password: true),
                const SizedBox(
                  height: 6,
                ),
                FormTextField(
                    title: 'Confirm password',
                    controller: confirmPasswordController,
                    node: confirmPasswordFocus,
                    password: true),
                const SizedBox(
                  height: 10,
                ),
                GetX<UserAuthController>(builder: (controller) {
                  return ExpandedButtonBlue(
                    title: registerString,
                    onTap: () async {
                      try {
                        await controller.registerUser(
                            usernameController.text,
                            emailController.text,
                            passwordController.text,
                            confirmPasswordController.text);
                        Utils.showSnackBar(context,
                            'Account created successfully', AppColor.success);
                      } catch (e) {
                        Utils.showSnackBar(
                            context, e.toString(), AppColor.error);
                      }
                    },
                    loading: controller.getRegisterLoading,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
