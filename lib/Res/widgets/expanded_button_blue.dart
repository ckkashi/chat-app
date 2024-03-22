// ignore_for_file: must_be_immutable

import 'package:chat_app/Res/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ExpandedButtonBlue extends StatelessWidget {
  String title;
  dynamic onTap;
  bool loading;
  ExpandedButtonBlue(
      {super.key,
      required this.title,
      required this.onTap,
      required this.loading});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kIsWeb ? 250 : double.infinity,
      child: CupertinoButton.filled(
          child: loading
              ? SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(
                    color: AppColor.light,
                    strokeWidth: 1.5,
                  ),
                )
              : Text(title),
          onPressed: onTap),
    );
  }
}
