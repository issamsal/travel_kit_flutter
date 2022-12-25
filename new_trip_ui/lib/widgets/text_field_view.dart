import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/themes.dart';
import '../utils/text_styles.dart';

class TextFieldView extends StatelessWidget {
  const TextFieldView({
    Key? key,
    this.isEnabled = true,
    this.isPrimaryUniqAddress = false,
    this.isObscureText = false,
    this.isAllowTopTitleView = true,
    this.onChanged,
    required this.controller,
    this.titleText = '',
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.height = 48,
    this.radius = 48,
    this.leftIcon,
    this.rightIcon,
    this.prefixText = '',
    this.textAlign = TextAlign.left,
    this.hintTextColor,
    this.inputFormatters,
    this.errorText,
    this.padding = EdgeInsets.zero,
    this.color,
    this.colorBorder,
    this.isShowNormalField = true,
    this.autofocus = false,
    this.focusNode,
    this.onTap,
    this.contextPadding,
    this.hintStyles,
  }) : super(key: key);

  final int maxLines;
  final double height, radius;
  final bool isEnabled,
      isObscureText,
      isPrimaryUniqAddress,
      isAllowTopTitleView;
  final String titleText, prefixText, hintText;
  final String? errorText;
  final TextStyle? hintStyles;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final Widget? leftIcon, rightIcon;
  final TextAlign textAlign;
  final EdgeInsetsGeometry padding;
  final bool isShowNormalField, autofocus;
  final FocusNode? focusNode;
  final Color? hintTextColor, color, colorBorder;
  final VoidCallback? onTap;
  final EdgeInsets? contextPadding;

  @override
  Widget build(BuildContext context) {
    final bool isFocused = focusNode != null && (focusNode?.hasFocus ?? false);
    final colorBorderData = colorBorder ?? Theme.of(context).dividerColor;
    final contextP = contextPadding ?? const EdgeInsets.only(left: 8);

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (isAllowTopTitleView && titleText != '' && titleText != '')
            Padding(
              padding: EdgeInsets.only(
                  left: isShowNormalField ? 16 : 0,
                  right: isShowNormalField ? 16 : 0,
                  top: 4,
                  bottom: 4),
              child: Text(
                titleText,
                style: TextStyles(context)
                    .getDescriptionStyle()
                    .copyWith(color: AppTheme.primaryTextColor),
              ),
            ),
          Container(
            decoration: BoxDecoration(
              color: color ?? Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(
                color: colorBorderData,
                width: 2,
              ),
            ),
            child: Padding(
              padding: leftIcon != null || prefixText != ''
                  ? const EdgeInsets.only(left: 8.0)
                  : EdgeInsets.zero,
              child: Row(
                children: [
                  if (leftIcon != null)
                    IconTheme(
                        data: IconThemeData(
                            color: isFocused
                                ? color
                                : Theme.of(context).iconTheme.color),
                        child: leftIcon!),
                  if (prefixText != '')
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        prefixText,
                        style: TextStyles(context).getRegularStyle(),
                      ),
                    ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 8, right: 0),
                      height: maxLines == 1 ? height : 138,
                      child: TextField(
                        enabled: isEnabled,
                        autocorrect: false,
                        focusNode: focusNode,
                        autofocus: autofocus,
                        enableSuggestions: false,
                        controller: controller,
                        maxLines: maxLines == 1 ? 1 : 6,
                        onChanged: onChanged,
                        style: TextStyles(context)
                            .getRegularStyle()
                            .copyWith(decoration: TextDecoration.none),
                        obscureText: isObscureText,
                        textAlign: textAlign,
                        cursorColor: Theme.of(context).primaryColor,
                        onTap: onTap,
                        onEditingComplete: () {
                          // FocusScope.of(context).nextFocus();
                          if (focusNode != null) {
                            focusNode?.unfocus();
                          } else {
                            FocusManager.instance.primaryFocus?.unfocus();
                          }

                          if (onChanged != null) {
                            onChanged!(controller.text);
                          }
                        },
                        decoration: InputDecoration(
                          errorText: null,
                          border: InputBorder.none,
                          hintText: hintText,
                          contentPadding: contextP,
                          hintStyle: hintStyles ??
                              TextStyles(context)
                                  .getDescriptionStyle()
                                  .copyWith(
                                      color: hintTextColor ??
                                          AppTheme.secondaryTextColor),
                        ),
                        keyboardType: keyboardType,
                        inputFormatters: [
                          if (inputFormatters != null) ...inputFormatters!,
                          ...keyboardType == TextInputType.number
                              ? <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ]
                              : [],
                        ],
                      ),
                    ),
                  ),
                  if (rightIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: rightIcon!,
                    ),
                ],
              ),
            ),
          ),
          if (errorText != null && errorText != '')
            Padding(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
              child: Text(
                errorText ?? "",
                style: TextStyles(context).getDescriptionStyle().copyWith(
                      color: Colors.red,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
