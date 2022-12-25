import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/local_files.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/utils/text_styles.dart';

class FriendsList extends StatelessWidget {
  final FriendListDetails getFriendList;
  final VoidCallback onTap;

  const FriendsList(
      {Key? key, required this.getFriendList, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          getFriendList.userProfileImage,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      if (getFriendList.isLive)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 10,
                            width: 20,
                            decoration: BoxDecoration(
                                color: Colors.green.shade400,
                                border: Border.all(
                                    color: AppTheme.scaffoldBackgroundColor),
                                shape: BoxShape.circle),
                          ),
                        )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                getFriendList.userName,
                                style: TextStyles(context).getRegularStyle(),
                              ),
                              Text(getFriendList.time,
                                  style: TextStyles(context)
                                      .getDescriptionStyle()),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(Loc.alized.chat_des_1,
                                style:
                                    TextStyles(context).getDescriptionStyle()),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class FriendListDetails {
  String userName;
  String userProfileImage;
  String messageDescription;
  String time;
  bool isLive;

  FriendListDetails({
    required this.userName,
    required this.userProfileImage,
    required this.messageDescription,
    required this.time,
    required this.isLive,
  });

  static List<FriendListDetails> getFriendList() => [
        FriendListDetails(
          userName: 'Advanture',
          userProfileImage: LocalFiles.avatar1,
          messageDescription:
              'Do you think marry would accept going on a trip of 6 peo... ',
          time: '16:09',
          isLive: true,
        ),
        FriendListDetails(
          userName: 'Beach',
          userProfileImage: LocalFiles.avatar6,
          messageDescription:
              'Do you think marry would accept going on a trip of 6 peo... ',
          time: '16:09',
          isLive: false,
        ),
        FriendListDetails(
          userName: 'Disney',
          userProfileImage: LocalFiles.avatar4,
          messageDescription:
              'Do you think marry would accept going on a trip of 6 peo... ',
          time: '16:09',
          isLive: false,
        ),
        FriendListDetails(
          userName: 'Ski',
          userProfileImage: LocalFiles.avatar3,
          messageDescription:
              'Do you think marry would accept going on a trip of 6 peo... ',
          time: '16:09',
          isLive: true,
        ),
        FriendListDetails(
          userName: 'Bali',
          userProfileImage: LocalFiles.avatar7,
          messageDescription:
              'Do you think marry would accept going on a trip of 6 peo... ',
          time: '16:09',
          isLive: false,
        ),
        FriendListDetails(
          userName: 'Ski',
          userProfileImage: LocalFiles.avatar6,
          messageDescription:
              'Do you think marry would accept going on a trip of 6 peo... ',
          time: '16:09',
          isLive: false,
        ),
        FriendListDetails(
          userName: 'Bali',
          userProfileImage: LocalFiles.avatar4,
          messageDescription:
              'Do you think marry would accept going on a trip of 6 peo... ',
          time: '16:09',
          isLive: false,
        ),
      ];
}
