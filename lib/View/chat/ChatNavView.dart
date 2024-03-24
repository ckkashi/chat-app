import 'package:chat_app/Res/colors.dart';
import 'package:chat_app/View/chat/ChatNavViews/ChatUsersList.dart';
import 'package:chat_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatNavView extends StatelessWidget {
  const ChatNavView({super.key});
  static const String viewID = "ChatListView";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size(double.infinity, 30),
                child: TabBar(
                    unselectedLabelColor: AppColor.blackGrey,
                    labelColor: AppColor.light,
                    dividerHeight: 50,
                    indicator: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(20), // Creates border
                        color: AppColor.blue),
                    tabs: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Tab(
                          text: 'Chats',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Tab(
                          text: 'All Users',
                        ),
                      ),
                    ])),
            body: Expanded(
                child: TabBarView(children: [ChatNavView(), ChatUsersList()])),
          ),
        );
      },
    ));
  }
}
