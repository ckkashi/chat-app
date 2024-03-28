// import 'dart:developer';

// import 'package:bloc/bloc.dart';
// import 'package:chat_app/Model/UserModel.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

// part 'users_event.dart';
// part 'users_state.dart';

// class UsersBloc extends Bloc<UsersEvent, UsersState> {
//   List<UserModel> usersList = [];
//   final firestoreInstance = FirebaseFirestore.instance;
//   UsersBloc() : super(UsersInitial()) {
//     on<getAllUsersListEvent>(_getAllUsersList);
//     on<getChatUsersListEvent>(_getChatUsersList);

//     add(getAllUsersListEvent());
//     add(getChatUsersListEvent());
//   }

//   _getAllUsersList(UsersEvent event, Emitter<UsersState> emit) async {
//     emit(GetAllUsersListLoading());
//     try {
//       await firestoreInstance
//           .collection('users')
//           .where('uid',
//               isNotEqualTo: FirebaseAuth.instance.currentUser!.uid.toString())
//           .get()
//           .then((value) {
//         value.docs.map((QueryDocumentSnapshot e) {
//           usersList.add(UserModel.fromJson(e.data() as Map<String, dynamic>));
//         }).toList();
//         log(usersList.toString());
//         emit(GetAllUsersListSuccess(usersList: usersList));
//       });
//     } on FirebaseException catch (e) {}
//   }

//   _getChatUsersList(UsersEvent event, Emitter<UsersState> emit) {}
// }
