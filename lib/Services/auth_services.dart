import 'package:chat_app/Model/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  FirebaseAuth authInstance = FirebaseAuth.instance;
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  Future<UserCredential> login(String email, String password) async {
    UserCredential userCredential = await authInstance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  Future<UserCredential> register(String email, String password) async {
    UserCredential userCredential = await authInstance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  Future<UserModel> loginUser(String email, String password) async {
    UserModel userData = UserModel();
    try {
      UserCredential user = await login(email, password);
      await firestoreInstance
          .collection('users')
          .doc(user.user!.uid.toString())
          .get()
          .then((value) {
        userData = UserModel.fromJson(value.data() as Map<String, dynamic>);
      }, onError: (error) {
        throw Exception(error.toString());
      });
      return userData;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  registerUser(String username, String email, String password) async {
    try {
      UserCredential user = await register(email, password);
      UserModel userModel = UserModel(
          uid: user.user!.uid.toString(),
          username: username,
          email: email,
          createdat: DateTime.now().toString());
      await firestoreInstance
          .collection('users')
          .doc(user.user!.uid.toString())
          .set(userModel.toJson());
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  logoutUser() async {
    await authInstance.signOut();
  }
}
