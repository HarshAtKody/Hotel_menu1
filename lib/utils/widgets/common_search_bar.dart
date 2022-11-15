import 'package:flutter/services.dart';
import 'package:hotel_menu1/utils/const.dart';
import 'package:hotel_menu1/utils/theme_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonSearchBar extends StatelessWidget with Constant{


  final double? height;
  final String? label;
  final bool? isHomeSearch;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmit;
  final double? elevation;
  final double? circularValue;
  final Color? clrSplash;
  final Color? clrBG;
  final bool? isRemoveMargin;
  Widget? prefix;
  TextEditingController controller;
  FocusNode? focusNode;
  final Color? borderColor;
  bool? prefixNeed;
  final double? borderRadius;
  final String? hintText;

  CommonSearchBar({Key? key, this.prefix, this.borderColor,this.height,this.label, this.isHomeSearch, this.onChanged, this.elevation, this.circularValue, this.clrSplash, this.clrBG,this.prefixNeed = true, this.isRemoveMargin, this.borderRadius,    required this.controller, this.focusNode, this.hintText, this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: borderColor == null ? clrSearchFontByTheme() : borderColor!),
          borderRadius: borderRadius == null ? BorderRadius.circular(11.r) : BorderRadius.circular(borderRadius!),
        ),
      height: height == null ? 45.h : height!,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Center(
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          cursorColor: clrPrimary,
          textAlignVertical: TextAlignVertical.center,
          style: TextStyles.txtRegular15.copyWith(color: clrTextByTheme()),
          textInputAction: TextInputAction.search,
          onChanged: onChanged,
          onFieldSubmitted:onSubmit,
          maxLines: 1,
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxTextLength60),
          ],
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            isDense: true,
            border: InputBorder.none,
            hintStyle: TextStyles.txtRegular15.copyWith(color: clrSearchFont),
            prefixIcon: prefixNeed == false ? prefix : Padding(
              padding: EdgeInsets.only(top:10.h,bottom: 10.h,right: 10.w),
              child: Image.asset(icSearch,height: 18.h,width: 18.w,color: clrTextByTheme(),),
            ),

            prefixIconConstraints: BoxConstraints(minHeight: 10.h, minWidth: 20.w),
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}


