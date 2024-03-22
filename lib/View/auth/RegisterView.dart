import 'package:chat_app/Res/colors.dart';
import 'package:chat_app/Res/constants.dart';
import 'package:chat_app/Res/utils.dart';
import 'package:chat_app/Res/widgets/expanded_button_blue.dart';
import 'package:chat_app/Res/widgets/form_text_field.dart';
import 'package:chat_app/View/auth/LoginView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  static const String viewID = "RegisterView";
  RegisterView({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();

  checkValues(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Utils.showSnackBar(context, 'Fill all fields', AppColor.error);
    } else if (password != confirmPassword) {
      Utils.showSnackBar(context, 'Passwords are not matched', AppColor.error);
    } else {
      registerUser(context, email, password);
    }
  }

  registerUser(BuildContext context, String email, String password) {}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
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
                            Navigator.pushNamed(context, LoginView.viewID);
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
                  ExpandedButtonBlue(
                      title: registerString, onTap: () {}, loading: false)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
