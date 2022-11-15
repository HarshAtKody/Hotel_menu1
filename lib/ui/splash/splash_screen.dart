import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_menu1/ui/menu/menu_screen.dart';
import 'package:hotel_menu1/utils/const.dart';
import 'package:hotel_menu1/utils/sliderightroute.dart';
import 'package:hotel_menu1/utils/theme_const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with Constant{
  ///Init State
  @override
  void initState() {
    super.initState();
    ///get ready required data

    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) async {
      String userToken = getUserAccessToken();

      int delayDuration = 3000; //3 Seconds
      if (userToken != "") {
        delayDuration = 1500; //1.5 Seconds

    }

      Future.delayed(Duration(milliseconds: delayDuration), () async {
        Route route = SlideRightPageRoute(builder: (context)=> const MenuScreen(), settings: const RouteSettings())  ;
        Navigator.pushReplacement(context,route);
      });
  });
  }

  /// build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetBody(),
    );
  }

  /// widget body
  Widget widgetBody() {
    return Container(
        color: clrCartBack,
        height: double.infinity,
        width: double.infinity,
        child: isDarkMode? Container(color: clrBlack,):
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hotel Menu", style: TextStyles.txtBold25.copyWith(color: clrBlack, fontSize: 35.h), textAlign: TextAlign.center,),

              SizedBox(height: 10.h,),
              Text("Digital 3D Hotel Menu", style: TextStyles.txtRegular13, textAlign: TextAlign.center,)
            ],
          ),
        )
    );
  }
}
