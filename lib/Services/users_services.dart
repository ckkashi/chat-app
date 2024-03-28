import 'dart:developer';

import 'package:chat_app/Model/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersServices {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
  Future<List<UserModel>> getAllUsers(String currentUID) async {
    List<UserModel> usersList = [];
    QuerySnapshot usersData = await firestoreInstance
        .collection('users')
        .where('uid', isNotEqualTo: currentUID)
        .get();
    usersData.docs.map((e) {
      usersList.add(UserModel.fromJson(e.data() as Map<String, dynamic>));
    }).toList();
    return usersList;
  }
}
