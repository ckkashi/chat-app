import 'package:chat_app/Res/colors.dart';
import 'package:chat_app/Res/constants.dart';
import 'package:chat_app/Res/widgets/expanded_button_blue.dart';
import 'package:chat_app/Res/widgets/form_text_field.dart';
import 'package:chat_app/View/auth/RegisterView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  static const String viewID = "LoginView";
  LoginView({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

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
                  text: 'Dont have an account? ',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: AppColor.blackGrey),
                  children: [
                    TextSpan(
                        style: TextStyle(color: AppColor.blue),
                        text: 'Register',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, RegisterView.viewID);
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
                      loginString,
                      textScaleFactor: 0.9,
                      style: theme.textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColor.blue,
                      ),
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
                    height: 10,
                  ),
                  ExpandedButtonBlue(
                    title: loginString,
                    onTap: () {},
                    loading: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
