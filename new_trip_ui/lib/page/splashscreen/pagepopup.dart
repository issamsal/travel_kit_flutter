import 'package:flutter/material.dart';
import 'package:new_trip_ui/constants/themes.dart';
import 'package:new_trip_ui/models/page_view_data.dart';
import 'package:new_trip_ui/utils/text_styles.dart';

class PagePopup extends StatelessWidget {
  final PageViewData imageData;
  final bool? isShowButton;

  const PagePopup({
    Key? key,
    required this.imageData,
    this.isShowButton,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        children: <Widget>[
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          SizedBox(
            height: 250,
            child: Image.asset(
              imageData.assetsImage,
              fit: BoxFit.contain,
            ),
          ),
          const Expanded(
            flex: 3,
            child: SizedBox(),
          ),
          Padding(
              padding: const EdgeInsets.only(
                  left: 24.0, right: 24.0, bottom: 8, top: 24),
              child: Text(
                imageData.titleText,
                style: TextStyles(context)
                    .getTitleStyle()
                    .copyWith(color: AppTheme.lightTextColor),
              )),
          Padding(
            padding: const EdgeInsets.only(
                left: 24.0, right: 24.0, top: 24, bottom: 24),
            child: Text(
              imageData.subText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).disabledColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
