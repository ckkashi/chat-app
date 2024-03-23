// ignore_for_file: must_be_immutable

import 'package:chat_app/Res/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  bool password;
  String title;
  TextEditingController controller;
  FocusNode node;
  FormTextField(
      {super.key,
      required this.title,
      required this.controller,
      required this.password,
      required this.node});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kIsWeb ? 250 : double.infinity,
      child: TextField(
        controller: controller,
        obscureText: password,
        focusNode: node,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
            label: Text(
              title,
            ),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.blue, width: 1.5))),
      ),
    );
  }
}
