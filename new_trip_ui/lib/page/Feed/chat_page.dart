import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:new_trip_ui/page/Feed/friend_list.dart';
import 'package:new_trip_ui/routes/navigator.dart';
import 'package:new_trip_ui/widgets/bottom_bar_animation.dart';

import '../../constants/themes.dart';

class ChatPage extends StatefulWidget {
  final AnimationController animationController;
  const ChatPage({Key? key, required this.animationController})
      : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<FriendListDetails> getFriendList = FriendListDetails.getFriendList();
  @override
  Widget build(BuildContext context) {
    return BottomBarAnimation(
      animationController: widget.animationController,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(
                  bottom: 68 + MediaQuery.of(context).padding.bottom),
              itemCount: getFriendList.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return Slidable(
                  startActionPane: ActionPane(
                      extentRatio: 0.15,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          backgroundColor: AppTheme.primaryDarkColor,
                          foregroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          icon: Icons.cancel,
                          onPressed: (c) {
                            setState(() {
                              getFriendList.removeAt(index);
                            });
                          },
                        ),
                      ]),
                  child: FriendsList(
                    getFriendList: getFriendList[index],
                    onTap: () {
                      NavigationServices().gotoMessageScreen();
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
