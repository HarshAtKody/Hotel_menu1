import 'package:hotel_menu1/utils/theme_const.dart';
import 'package:flutter/material.dart';

class CommonImageAsset extends StatelessWidget with Constant{

  final String strIcon;
  final Color? clrImg;
  final double? height;
  final double? width;
  final BoxFit? boxFit;

  CommonImageAsset({Key? key, this.strIcon="", this.clrImg, this.height, this.width, this.boxFit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      strIcon,
      color: clrImg,
      height: height,
      width: width,
      fit: boxFit??BoxFit.fill,
    );
  }
}
