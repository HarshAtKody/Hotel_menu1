import 'package:hotel_menu1/utils/theme_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonText extends StatelessWidget with Constant{

  final String title;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? fontSize;
  final Color? clrFont;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;

  CommonText({Key? key, this.title="", this.fontWeight, this.fontStyle, this.fontSize, this.clrFont, this.maxLines, this.textAlign, this.textDecoration}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Text(
      title,
      textScaleFactor: 1.0, //-- will not change if system fonts size changed
      maxLines: maxLines??1,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontFamily: fontFamily,
          fontWeight: fontWeight??fwRegular,
          fontSize: fontSize??14.sp,
          color: clrFont??clrBlack,
          fontStyle: fontStyle??FontStyle.normal,
          decoration: textDecoration??TextDecoration.none
      ),
    );
  }

}