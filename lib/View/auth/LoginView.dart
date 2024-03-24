import 'package:chat_app/Res/colors.dart';
import 'package:chat_app/Res/constants.dart';
import 'package:chat_app/Res/utils.dart';
import 'package:chat_app/Res/widgets/expanded_button_blue.dart';
import 'package:chat_app/Res/widgets/form_text_field.dart';
import 'package:chat_app/View/after_auth/HomeView.dart';
import 'package:chat_app/View/auth/RegisterView.dart';
import 'package:chat_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  static const String viewID = "LoginView";
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController(text: 'ckkashi007@gmail.com');

  final passwordController = TextEditingController(text: '12345678');

  final emailFocus = FocusNode();

  final passwordFocus = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final theme = Theme.of(context);
    return SafeArea(
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          print(state);
          if (state is AuthError) {
            Utils.showSnackBar(context, state.error, AppColor.error);
          } else if (state is AuthSuccess) {
            Utils.showSnackBar(
                context, state.message, const Color.fromRGBO(76, 175, 80, 1));
            Navigator.pushReplacementNamed(context, HomeView.viewID);
          }
        },
        builder: (context, state) {
          return Scaffold(
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
                      text: 'Dont have an account? ',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: AppColor.blackGrey),
                      children: [
                        TextSpan(
                            style: TextStyle(color: AppColor.blue),
                            text: 'Register',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                    context, RegisterView.viewID);
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
                        onTap: () async {
                          authBloc.add(AuthLoginEvent(
                              email: emailController.text,
                              password: passwordController.text));
                        },
                        loading: state is AuthLoading,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
