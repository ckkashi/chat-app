// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/Model/UserModel.dart';
import 'package:chat_app/Res/colors.dart';
import 'package:chat_app/Res/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseController extends ChangeNotifier {
  final _authInstance = FirebaseAuth.instance;
  final _storeInstance = FirebaseFirestore.instance;
  UserCredential? userCredential;
  void userRegister(BuildContext context, String email, String password) async {
    try {
      await _authInstance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        userCredential = value;
        UserModel currentUser = UserModel(email: email, uid: value.user!.uid);
        await _storeInstance
            .collection('users')
            .doc(value.user!.uid)
            .set(currentUser.toJson());
        Utils.showSnackBar(context, 'Register successfully.', AppColor.success);
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(context, e.message!, AppColor.error);
    }
  }
}
