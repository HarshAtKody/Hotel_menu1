import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_menu1/utils/theme_const.dart';

class CustomTextField extends StatelessWidget with Constant{

  BuildContext context;
  TextEditingController? mycontroller;
  ValueChanged<String>? onChanged;
  List<TextInputFormatter>? inputFormatters;
  TextInputAction? textInputAction;
  TextInputType? textInputType;
  String? placeHolderMessage;
  String? errorMessage;
  String? hintText;
  bool obscureText;
  bool enable;
  FocusNode? myfocus;
  int? maxLine;
  int? maxLength;
  double? height;
  Widget? preFix;
  Widget? sufFix;
  double? leftPadding;
  Color bgColor;
  Color? borderColor;
  Function()? onEditingComplete;
  double? borderRadius;
  bool? paddingNeed;
  bool? marginNeed;
  double? rightPadding;


  CustomTextField(
      {Key? key,
    required this.context,
    required this.mycontroller,
    this.onChanged,
    this.textInputType,
    this.textInputAction,
    this.placeHolderMessage = "",
    this.errorMessage = "",
    this.hintText = "",
    this.obscureText = false,
    this.enable = true,
    this.inputFormatters,
    this.myfocus,
    this.maxLine,
    this.height,
    this.preFix,
    this.sufFix,
    this.borderRadius,
    this.leftPadding,
    this.paddingNeed = true,
    this.marginNeed = true,
    required this.bgColor,
    this.maxLength,
    this.onEditingComplete,
    this.borderColor,
    this.rightPadding
  }) : super(key: key);
  


  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height??60.h,
          margin: marginNeed == true ?EdgeInsets.symmetric(vertical: 0.h, horizontal: 15.w): null,
          padding: paddingNeed == true ? EdgeInsets.symmetric(vertical: 0.h, horizontal: leftPadding ?? 10.w) : null,
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: borderRadius == null ? BorderRadius.circular(25.r) : BorderRadius.circular(borderRadius!),
              border: Border.all(color: borderColor?? clrTextGrey)
           ),
          alignment: Alignment.center,
          child: TextFormField(
            autofocus: false,
            maxLines: maxLine??1,
            enabled: enable,
            controller: mycontroller,
            onChanged: onChanged,
            focusNode: myfocus,
            cursorColor: clrTextByTheme(),
            obscureText: obscureText,
            keyboardType: textInputType,
            textInputAction: textInputAction,
            maxLength: maxLength,
            onEditingComplete: onEditingComplete,
            style: TextStyle(
                fontSize: 14.sp,
                color: clrTextByTheme(),
                fontWeight: fwSemiBold
            ),
            inputFormatters:inputFormatters,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              // isDense: true,
              suffixIcon:sufFix ?? const Offstage(),
                contentPadding: EdgeInsets.only(left: 0.w,top: 20.h,right: rightPadding?? 30.w),
              //   prefix: preFix,
                labelText: placeHolderMessage,

                alignLabelWithHint: true,
                prefixIcon: preFix,
                hintStyle: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 12.sp,
                    color: clrHintText,
                    fontWeight: fwMedium),
                labelStyle: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 15.sp,
                    color: clrTextGrey,
                    fontWeight: fwRegular),
                errorStyle: TextStyle(color: clrBlack),
              focusedBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: clrTransparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: clrTransparent),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: clrTransparent),
              ),
              hintText: hintText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: clrTransparent),
              ),
            ),
          ),
        ),
        (errorMessage != null && errorMessage != "") ? Padding(
          padding:EdgeInsets.only(top:6.h,bottom: 6.h, left: 20.w),
          child: Text(
            errorMessage??"",
            style: TextStyle(
                fontSize: 12.sp,
                color: clrDarkRed,
                fontWeight: fwRegular
            ),
          ),
        ) : Container()
      ],
    );
  }

}
