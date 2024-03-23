// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:chat_app/Model/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserModel _userdata = UserModel();
  AuthBloc() : super(AuthInitial()) {
    on<AuthRegister>(_onAuthRegister);
    on<AuthLogin>(_onAuthLogin);
    on<UserLogout>(_onUserLogout);
    on<GetUser>(_onGetUser);
  }

  bool checkEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  _getUserData(String uid) async {
    await firestoreInstance.collection('users').doc(uid).get().then((value) {
      _userdata = UserModel.fromJson(value.data() as Map<String, dynamic>);
      if (kDebugMode) {
        print('${_userdata.uid} ${_userdata.email}');
      }
      emit(AuthGetUser(user: _userdata));
    }, onError: (error) {
      emit(AuthError(error: error.toString()));
      authInstance.signOut();
    });
  }

  FirebaseAuth authInstance = FirebaseAuth.instance;
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  _onAuthRegister(AuthRegister event, Emitter<AuthState> emit) async {
    String username = event.username;
    String email = event.email;
    String password = event.password;
    String confirmpassword = event.confirmpassword;
    if (username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmpassword.isEmpty) {
      emit(AuthError(error: "Fill all fields"));
    } else if (!checkEmail(email)) {
      emit(AuthError(error: "Enter valid email"));
    } else if (password != confirmpassword) {
      emit(AuthError(error: "Passwords are not matched"));
    } else {
      try {
        emit(AuthLoading());
        await authInstance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) async {
          User _user = value.user!;
          UserModel newUser = UserModel(
              uid: _user.uid.toString(),
              username: username,
              email: email,
              createdat: DateTime.now().toString());
          await firestoreInstance
              .collection('users')
              .doc(_user.uid.toString())
              .set(newUser.toJson())
              .then((value) {
            emit(AuthSuccess(message: 'Account created successfully'));
          }, onError: (error) {
            emit(AuthError(error: error.toString()));
          });
        });
      } on FirebaseException catch (e) {
        emit(AuthError(error: e.message.toString()));
        print('Error: ${e.toString()}');
      }
    }
  }

  _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    String email = event.email;
    String password = event.password;
    if (email.isEmpty || password.isEmpty) {
      emit(AuthError(error: "Fill all fields"));
    } else if (!checkEmail(email)) {
      emit(AuthError(error: "Enter valid email"));
    } else {
      try {
        emit(AuthLoading());
        await authInstance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) async {
          User _user = value.user!;
          await _getUserData(_user.uid.toString());
          emit(AuthSuccess(message: 'Account loggedin successfully'));
        });
      } on FirebaseException catch (e) {
        emit(AuthError(error: e.message.toString()));
        print('Error: ${e.toString()}');
      }
    }
  }

  _onUserLogout(UserLogout event, Emitter<AuthState> emit) async {
    await authInstance.signOut().then((value) {
      _userdata = UserModel();
      emit(AuthUserLogout(message: 'User loggedout'));
    });
  }

  _onGetUser(GetUser event, Emitter<AuthState> emit) {
    if (_userdata.uid != null) {
      emit(AuthGetUser(user: _userdata));
    } else {
      authInstance.idTokenChanges().listen((user) async {
        if (user != null) {
          await _getUserData(user.uid.toString());
        } else {
          emit(AuthError(error: 'User not loggedin'));
        }
      });
    }
  }
}
