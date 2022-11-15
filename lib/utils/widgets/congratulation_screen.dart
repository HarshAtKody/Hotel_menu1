import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_menu1/utils/const.dart';
import 'package:hotel_menu1/utils/theme_const.dart';
import 'package:hotel_menu1/utils/widgets/common_button.dart';

class CongratulationsScreen extends StatelessWidget with Constant{
  final String title;
  final String subTitle;
  final String buttonLabel;
  final String image;
  final Function() ontap;

  CongratulationsScreen({Key? key, required this.title, required this.subTitle, required this.buttonLabel, required this.image, required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
       !isDarkMode ? Image.asset(icBackground,
              height: double.infinity,
              width: double.infinity,fit: BoxFit.cover)
           : Container(
              color: clrScaffoldBGDarkMode,
             ),
          bodyWidget(),
        ],
      ),
    );
  }


  /// Widget body
  Widget bodyWidget(){
    return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              SizedBox(height: 300.h,),
              Expanded(
                flex: 5,
                child: Padding(
                  padding:   EdgeInsets.symmetric(horizontal:40.w),
                  child: Column(
                    children: [
                      /// Image
                      Image.asset(image,width: 100.w,height: 80.h,),
                      SizedBox(height: 30.h,),

                      /// Title
                      Text(title,style: TextStyles.txtSemiBold18.copyWith(fontSize: 24.sp),),
                      SizedBox(height: 30.h,),

                      /// Note Or subtitle
                      Text(subTitle,style: TextStyles.txtRegular18.copyWith(),textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              ),
              /// Button
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
                child: CommonButton(
                  height: 50.h,
                  onTap:ontap,
                  bgColor: clrImageColorByTheme(),
                  label: buttonLabel,
                  labelColor: clrWhite,
                ),
                ),
              ),
          ],
    );
  }
}
