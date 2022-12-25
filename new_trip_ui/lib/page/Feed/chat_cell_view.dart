import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/local_files.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/logic/language/app_localizations.dart';
import 'package:new_trip_ui/utils/text_styles.dart';
import 'package:new_trip_ui/widgets/card_view.dart';
import 'package:new_trip_ui/widgets/remove_focuse.dart';
import 'package:new_trip_ui/widgets/text_field_view.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  TextEditingController msgTypeBoxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RemoveFocuse(
        onClick: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 16.0,
                  top: MediaQuery.of(context).padding.top + 8,
                  right: 24,
                  bottom: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.keyboard_arrow_left_rounded,
                            color: AppTheme.primaryTextColor,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: CircleAvatar(
                          radius: 18.0,
                          backgroundImage: AssetImage(LocalFiles.profileJpg),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Nicole Foley",
                          style: TextStyles(context).getBoldStyle().copyWith(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
            Expanded(
                child: ListView(
              reverse: true,
              children: [
                getChatCellUI(
                  false,
                  Loc.alized.chat_text1,
                ),
                getChatCellUI(
                  true,
                  Loc.alized.chat_text2,
                ),
                getChatCellUI(
                  false,
                  Loc.alized.chat_text3,
                ),
              ],
            )),
            CardView(
              color: AppTheme.backgroundColor,
              borderColor: Colors.transparent,
              radius: 0,
              elevation: 8,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom),
                child: Column(
                  children: [
                    Divider(
                      height: 1,
                      color: AppTheme.primaryTextColor.withOpacity(0.2),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.add_circle_outline,
                                color: AppTheme.primaryColor,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextFieldView(
                              colorBorder: Colors.transparent,
                              controller: msgTypeBoxController,
                              maxLines: 1,
                              hintText: Loc.alized.type_something,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.send,
                                color: AppTheme.primaryColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getChatCellUI(bool isSelfUser, String text) {
    return Padding(
      padding: EdgeInsets.only(
        left: isSelfUser ? 90 : 16,
        right: !isSelfUser ? 48 : 24,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isSelfUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSelfUser)
            const SizedBox(
              width: 50,
              height: 50,
              child: CircleAvatar(
                backgroundImage: AssetImage(LocalFiles.profileJpg),
              ),
            ),
          Flexible(
            child: Column(
              crossAxisAlignment: isSelfUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomRight: Radius.circular(isSelfUser ? 0 : 16),
                      bottomLeft: Radius.circular(!isSelfUser ? 0 : 16),
                    ),
                    color: isSelfUser
                        ? AppTheme.primaryColor.withOpacity(0.2)
                        : AppTheme.lightTextColor.withOpacity(0.2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      style: TextStyles(context)
                          .getDescriptionStyle()
                          .copyWith(color: AppTheme.primaryTextColor),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, bottom: 8.0, top: 8.0),
                  child: Text(
                    "10:34PM",
                    style: TextStyles(context)
                        .getDescriptionStyle()
                        .copyWith(color: AppTheme.secondaryTextColor),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
