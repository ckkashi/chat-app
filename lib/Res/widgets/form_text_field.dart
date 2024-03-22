// ignore_for_file: must_be_immutable

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
          label: Text(
            title,
          ),
        ),
      ),
    );
  }
}
