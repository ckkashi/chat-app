import 'package:chat_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});
  static const String viewID = "ChatListView";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold();
      },
    ));
  }
}
