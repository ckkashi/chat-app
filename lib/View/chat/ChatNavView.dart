import 'package:chat_app/Res/colors.dart';
import 'package:chat_app/View/chat/ChatNavViews/AllUsersList.dart';
import 'package:chat_app/View/chat/ChatNavViews/ChatUsersList.dart';
import 'package:chat_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatNavView extends StatelessWidget {
  const ChatNavView({super.key});
  static const String viewID = "ChatNavView";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 35),
            child: TabBar(
                labelStyle: Theme.of(context).textTheme.titleMedium,
                unselectedLabelColor: AppColor.blackGrey,
                labelColor: AppColor.light,
                dividerHeight: 0,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // Creates border
                    color: AppColor.blue),
                tabs: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Center(
                      child: Tab(
                        text: 'Chats',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Center(
                      child: Tab(
                        text: 'All Users',
                      ),
                    ),
                  ),
                ])),
        body: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [ChatUsersList(), AllUsersList()])),
      ),
    ));
  }
}
