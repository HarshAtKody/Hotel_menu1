import 'package:flutter/material.dart';
import 'package:hotel_menu1/utils/theme_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonButton extends StatelessWidget with Constant {
  final String label;
  final Function()? onTap;
  final Color bgColor;
  final Color labelColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final double? textSize;
  final bool isEnable;
  final double? padding;

  CommonButton(
      {Key? key,
        required this.label,
        required this.onTap,
        required this.bgColor,
        required this.labelColor,
        this.borderColor,
        this.borderRadius,
        this.height,
        this.width,
        this.padding,
        this.isEnable = true,
        this.textSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??49.h,
      width: width??double.infinity,
      child: ElevatedButton(
        onPressed: isEnable?onTap:null,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0.0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius??25.r),
                side: BorderSide(color: !isEnable ? clrTextGrey : borderColor ?? bgColor)),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(!isEnable ? clrTextGrey:bgColor),
        ),
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21.r)),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal:padding??0),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: textSize??15.sp,
                          fontFamily: fontFamily,
                          color: labelColor,
                          fontWeight: fwRegular),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}