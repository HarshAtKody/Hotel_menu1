import 'package:flutter/material.dart';
import 'package:hotel_menu1/utils/const.dart';
import 'package:hotel_menu1/utils/theme_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchAppbar extends StatelessWidget with Constant implements PreferredSizeWidget{

  Function()? onTap;
  ValueChanged<String>? onChanged;
  Function(String)? onSubmit;
  final AppBar appBar;
  final String? title;
  TextEditingController? searchCTR;

   SearchAppbar({Key? key,required this.appBar,required this.onTap,required this.searchCTR, this.onChanged, this.onSubmit, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
            child: Icon(Icons.clear,color: clrTextByTheme(),),
          )),
      titleSpacing: 0,
      title: widgetSearchTextField(),
      actions: [SizedBox(width: 20.w,)],
    );
  }

  /// search textField
  Widget widgetSearchTextField(){
    return Container(
      height: 45.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.r),
        border: Border.all(color: clrTextByTheme().withOpacity(0.2)),
      ),
      child: TextField(
        cursorColor: clrPrimary,
        controller: searchCTR,
        onChanged: onChanged,
        onSubmitted: onSubmit,
        style: TextStyles.txtRegular12.copyWith(color: clrTextFieldBorderColorByTheme()),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
          hintText:title ?? getLocalValue("Key_SearchMemberIDMemberName"),
          hintStyle: TextStyles.txtRegular12.copyWith(color: clrTextFieldBorderColorByTheme()),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
