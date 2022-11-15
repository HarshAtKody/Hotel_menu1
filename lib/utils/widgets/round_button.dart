// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_menu1/utils/theme_const.dart';

class RoundButton extends StatelessWidget with Constant {

  final String label;
  final Function()? onTap;
  final double? fontSize;
  final double? minWidth;
  final Color? bgColor;
  final Color? titleColor;
  final bool isEnable;
  final Color borderColor;

  RoundButton({
    Key? key,
    this.label = "",
    this.onTap,
    this.fontSize,
    this.minWidth,
    this.bgColor,
    this.titleColor,
    this.isEnable = true,
    this.borderColor = Colors.transparent
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: minWidth??130.w,
      child: InkWell(
        onTap: (isEnable) ? onTap : null,
        child: Container(
          padding: const EdgeInsets.all(0.0),
          decoration: BoxDecoration(
            border: Border.all(
                  color: borderColor,
                  width: 1,
                  style: BorderStyle.solid
              ),
              borderRadius: BorderRadius.circular(25.h)),
          child: Ink(
            decoration: BoxDecoration(
                color: (bgColor ?? clrPrimary).withOpacity((isEnable ? 1.0 : 0.4)),
                borderRadius: BorderRadius.circular(25.h)
            ),
            child: Container(
              constraints: BoxConstraints(minWidth: minWidth??130.w, minHeight: 50.h),
              alignment: Alignment.center,
              child: Text(
                // getLocalValue(context, label),
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: fontSize??16.sp,
                    color: titleColor ?? clrWhite,
                    fontWeight: fwRegular
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}