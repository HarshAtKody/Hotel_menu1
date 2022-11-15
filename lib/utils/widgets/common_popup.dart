import 'package:hotel_menu1/utils/const.dart';
import 'package:hotel_menu1/utils/extension/string_extension.dart';
import 'package:hotel_menu1/utils/theme_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonPopUp extends StatelessWidget with Constant{
  final List<String>? title;
  final List<String>? image;


  final Widget? buttonIcon;
  CommonPopUp({Key? key,this.image ,this.title ,@required this.buttonIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: EdgeInsets.symmetric(vertical: 0.h,horizontal: 0.w),
      elevation: 6.0,
      enabled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: buttonIcon,
      itemBuilder: (context) {

        return List.generate(title?.length ?? 0 , (index) {
          return PopupMenuItem(
            value: index,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
                choiceAction(context, title![index]);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                       title?[index].localized ?? "",
                        style: TextStyle(
                          fontWeight: fwSemiBold,
                          color: clrFontCart,
                          fontSize: 9.sp,
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Image.asset(image?[index] ?? "",height: 15.h,width: 13.w,fit: BoxFit.fill,)
                    ],
                  ),
                  ((title?.length ?? 1)-1) == index  ? const Offstage(): Divider(
                    color: clrCartBack,
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
  choiceAction(BuildContext context,String choice){
    showLog(choice);
    switch (choice) {

      case ("Key_Report"):
       // Navigator.pushNamed(context, Routes.REASON_TO_REPORT_SCREEN);
        break;
      case ("Key_StartChat"):
        //Navigator.pushNamed(context, Routes.POPULAR_SERVICE_PROPOSAL_CHAT_START);
        break;

      default:
    }
  }
}
