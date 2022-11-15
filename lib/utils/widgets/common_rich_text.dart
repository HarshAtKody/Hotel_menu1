import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_menu1/utils/theme_const.dart';


class CommonRichText extends StatelessWidget with Constant {
  String startTxt;
  String endTxt;
  Color clrStart;
  Color clrEnd;
  double? fontSize;
  TextAlign textAlign;

  CommonRichText(
      {Key? key, this.startTxt = "", this.endTxt = "", this.fontSize = 12, this.clrStart = Colors.black, this.clrEnd = Colors.black,this.textAlign = TextAlign.center}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: startTxt,
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: fwRegular,
                fontFamily: fontFamily,
                color: clrStart),
          ),
          TextSpan(
            text: " $endTxt",
            style: TextStyle(
                fontSize: fontSize ?? 20.sp,
                fontWeight: fwRegular,
                fontFamily: fontFamily,
                color: clrEnd),
          ),
        ],
      ),
    );
  }
}
