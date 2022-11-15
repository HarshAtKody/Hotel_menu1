
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_menu1/utils/extension/extension.dart';
import 'package:hotel_menu1/utils/theme_const.dart';

class AppInputField extends StatelessWidget with Constant {
  AppInputField(
      {Key? key,
        this.isShowLabel = true,
        this.labelTitle,
        this.inputHintText,
        this.minLine = 1,
        this.focusedInputBorder,
        this.focusedErrorBorder,
        this.border,
        this.enabledInputBorder,
        this.disabledInputBorder,
        this.onTextChanged,
        this.validation,
        this.suffixIcon,
        this.radius = 0,
        this.isError,
        this.errorMessage,
        this.isErrorPwd,
        this.isAutoFocus,
        this.onSaved,
        this.inputController,
        this.isEnabled,
        this.keyboardType,
        this.inputAction,
        this.maxLength,
        this.maxLines,
        this.textCapitalization,
        this.onSuffixPressed,
        this.onFieldSubmitted,
        this.obscureText,
        this.height,
        this.inputFormatter,
        this.labelTextStyle,
        this.hintTextStyle,
        this.prefixIcon,
        this.counterText,
        this.focusNode,
        this.disableColor
      })
      : super(key: key);
  final bool isShowLabel;
  final String? labelTitle;
  final String? inputHintText;
  final int? minLine;
  final InputBorder? focusedInputBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? border;
  final InputBorder? enabledInputBorder;
  final InputBorder? disabledInputBorder;
  final void Function(String)? onTextChanged;
  final String? Function(String? str)? validation;
  final Function(String? str)? onSaved;
  final Widget? suffixIcon;
  final double radius;
  final TextEditingController? inputController;
  final bool? isEnabled;
  final bool? isError;
  final bool? isErrorPwd;
  final bool? isAutoFocus;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final int? maxLength;
  final int? maxLines;
  final TextCapitalization? textCapitalization;
  final Function? onSuffixPressed;
  final Function(String? str)? onFieldSubmitted;
  final bool? obscureText;
  final double? height;
  final List<TextInputFormatter>? inputFormatter;
  final TextStyle? labelTextStyle;
  final TextStyle? hintTextStyle;
  final Widget? prefixIcon;
  final String? counterText;
  final FocusNode? focusNode;
  final Color? disableColor;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (isShowLabel)
          Text(
            labelTitle ?? '',
            style: TextStyles.txtNormal16.copyWith(color: clrHintText.withOpacity(0.5)),
          ).paddingOnly(bottom: 10.h),
        SizedBox(
          height: isError ?? false
              ? isErrorPwd ?? false
              ? 80.h
              : 65.h
              : height ?? 49.h,
          child: TextFormField(
            onSaved: onSaved,
            onChanged: onTextChanged,
            controller: inputController,
            focusNode: focusNode,
            validator: validation,
            style: labelTextStyle ??
                TextStyles.txtNormal16
                    .copyWith(color: clrFontCart),
            textInputAction: inputAction ?? TextInputAction.next,
            maxLines: maxLines ?? 1,
            minLines: minLine,
            maxLength: maxLength,
            autofocus: isAutoFocus ?? false,
            obscureText: obscureText ?? false,
            keyboardType: keyboardType ?? TextInputType.text,
            enabled: isEnabled ?? true,
            inputFormatters: inputFormatter,
            textCapitalization:
            textCapitalization ?? TextCapitalization.sentences,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              labelText: inputHintText ?? 'Key_TypeHere'.tr(),
              labelStyle: hintTextStyle ??
                  TextStyles.txtNormal16.apply(color: clrHintText),

              hintText: inputHintText ?? 'Key_TypeHere'.tr(),
              hintStyle: hintTextStyle ??
                  TextStyles.txtNormal16.apply(color: clrHintText),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: true,
              fillColor: isError ?? false
                  ? clrWhite
                  : isEnabled ?? true
                  ? clrWhite
                  : disableColor ?? clrHintText.withOpacity(0.5),
              focusedBorder: focusedInputBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: clrWhite,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(radius),
                    ),
                  ),
              focusedErrorBorder: focusedErrorBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(color: clrWhite),
                    borderRadius: BorderRadius.all(
                      Radius.circular(radius),
                    ),
                  ),
              errorBorder: focusedErrorBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(color: clrWhite),
                    borderRadius: BorderRadius.all(
                      Radius.circular(radius),
                    ),
                  ),

              border: border ??
                  OutlineInputBorder(
                    borderSide: BorderSide(color: clrWhite),
                    borderRadius: BorderRadius.all(
                      Radius.circular(radius),
                    ),
                  ),
              enabledBorder: enabledInputBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(color: clrWhite),
                    borderRadius: BorderRadius.all(
                      Radius.circular(radius),
                    ),
                  ),
              disabledBorder: disabledInputBorder ??
                  OutlineInputBorder(
                    borderSide: BorderSide(color: disableColor ?? clrHintText.withOpacity(0.5)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(radius),
                    ),
                  ),
              suffixIcon: /*isError == null
                  ? null
                  : isError!
                  ? suffixIcon
                  : */suffixIcon,
              suffixIconConstraints:
              BoxConstraints(minHeight: 16.w, minWidth: 16.w),
              // errorText: errorLabelText ?? '',
              errorStyle: TextStyles.txtRegular12.apply(
                color: clrPrimary,
              ),
              errorMaxLines: 2,
              contentPadding: EdgeInsetsDirectional.fromSTEB(10.w, 8.h, 16.w, 8.h),
              prefixIcon: prefixIcon,
              prefixIconConstraints: BoxConstraints(minHeight: 16.w, minWidth: 16.w),
              counterText: counterText ?? '',
            ),
          ),
        ),
        (errorMessage != null && errorMessage != "")
            ? Padding(
          padding: EdgeInsets.fromLTRB(0.w, 6.h, 0.w, 6.h),
          child: Text(
            errorMessage ?? "",
            style: TextStyle(
                fontSize: 12.sp,
                color: clrRed,
                fontFamily: fontFamily,
                fontWeight: fwRegular),
          ),
        )
            : Container()
      ],
    );
  }
}