import 'package:flutter/material.dart';
import '../constants/themes.dart';

// class TextStyles {
//   final BuildContext context;

//   TextStyles(this.context);

//   TextStyle getTitleStyle() {
//     return Theme.of(context).textTheme.headline6!.copyWith();
//   }

//   TextStyle getDescriptionStyle() {
//     return Theme.of(context).textTheme.bodyText1!.copyWith(
//           color: AppTheme.lightGrayTextColor,
//           fontFamily: AppTheme.mediumFont,
//         );
//   }

//   TextStyle getRegularStyle() {
//     return Theme.of(context).textTheme.bodyText1!.copyWith(
//           fontSize: 14,
//           fontFamily: AppTheme.boldFont,
//           color: AppTheme.darkTextColor,
//         );
//   }

//   TextStyle getBoldStyle() {
//     return Theme.of(context).textTheme.subtitle1!.copyWith(
//           fontSize: 14,
//           fontFamily: AppTheme.boldFont,
//           color: AppTheme.darkTextColor,
//         );
//   }

//   TextStyle getMediumStyle() {
//     return Theme.of(context).textTheme.subtitle1!.copyWith(
//           fontSize: 14,
//           fontWeight: FontWeight.bold,
//           color: AppTheme.darkTextColor,
//         );
//   }
// }
class TextStyles {
  final BuildContext context;

  TextStyles(this.context);

  TextStyle getTitleStyle() {
    return Theme.of(context).textTheme.subtitle1!.copyWith(
          fontSize: Theme.of(context).textTheme.headline5!.fontSize,
        );
  }

  TextStyle getDescriptionStyle() {
    return Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(color: AppTheme.secondaryTextColor, fontSize: 12);
  }

  TextStyle getRegularStyle() {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 16,
          color: AppTheme.primaryTextColor,
        );
  }

  TextStyle getMediumStyle() {
    return Theme.of(context).textTheme.subtitle1!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppTheme.primaryTextColor,
        );
  }

  TextStyle getBoldStyle() {
    return Theme.of(context).textTheme.subtitle2!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppTheme.primaryTextColor,
        );
  }
}
