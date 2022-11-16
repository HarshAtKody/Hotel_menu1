import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_menu1/ui/menu/details_screen.dart';
import 'package:hotel_menu1/utils/const.dart';
import 'package:hotel_menu1/utils/extension/string_extension.dart';
import 'package:hotel_menu1/utils/sliderightroute.dart';
import 'package:hotel_menu1/utils/theme_const.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with Constant{

 int isSelected = 0;
 bool isClicked = false;

 TextEditingController searchCTR = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clrWhite,
      appBar: customAppbar(),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          hideKeyboard(context);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 30.h,
                  child: ListView.separated(
                    separatorBuilder: (context, i){
                      return SizedBox(width: 10.w,);
                      },
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: nameOfFood.length,
                      itemBuilder: (context, i){
                    return InkWell(
                      onTap: (){
                       setState(() {
                         isSelected = i;
                       });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                        decoration: (i == isSelected)
                            ? BoxDecoration(
                            color: clrParrotGreen.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20.r))
                            : BoxDecoration(
                            color: clrTransparent,
                            borderRadius: BorderRadius.circular(20.r)
                        ),
                        child: Center(child: Text(nameOfFood[i], style: TextStyles.txtRegular11.copyWith(color:(i == isSelected) ? clrWhite: clrBaseGrey),)),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 5.h,),
              bodyWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 65.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconNameWidget(icHome, "Home", (){}),
            iconNameWidget(icOrder, "Order", (){}),
            iconNameWidget(icCart, "Cart", (){}),
            iconNameWidget(icProfile, "Profile", (){}),
          ],
        ),
      ),
    );
  }

  Widget iconNameWidget(String iconName, String title, Function() onTap){
    return  InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconName, color: clrBlack,height: 30.h,width: 30.h,),
          Text(title, style: TextStyles.txtSemiBold12.copyWith(fontSize: 8.sp),)
        ],
      ),
    );
  }

 PreferredSizeWidget customAppbar(){
    return PreferredSize(
      preferredSize: Size.fromHeight(190.h), // Set this height
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(25.r), bottomLeft: Radius.circular(25.r)),
          image: DecorationImage(
            fit: BoxFit.cover,
           image: AssetImage(icAppBarBG,),
         ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              SizedBox(
                height: 56.h,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: (){},
                        child: Image.asset(icBack, height: 30.h, width: 30.h,)),
                    const Spacer(),
                    InkWell(
                        onTap: (){
                          setState(() {
                          isClicked = !isClicked;
                          });
                        },
                        child: Image.asset(isClicked? icLikeFill: icLike, height: 30.h, width: 30.h,)),
                    SizedBox(width: 20.w,),
                    Text("Info", style: TextStyles.txtRegular14.copyWith(color: clrWhite)),
                    InkWell(
                        onTap: (){},
                        child: Image.asset(icInfo, height: 30.h, width: 30.h,)),
                  ],
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: (){},
                      child: Image.asset(icDominoz, height: 40.h, width: 40.h,)),
                  SizedBox(width: 6.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Domino's Pizza", style: TextStyles.txtRegular18.copyWith(color: clrWhite),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: (){},
                              child: Image.asset(icStar, height: 30.h, width: 30.h,)),
                          Text("4.5", style: TextStyles.txtRegular15.copyWith(color: clrWhite, decoration: TextDecoration.underline, decorationStyle: TextDecorationStyle.solid, decorationThickness: 2),),
                          const Text(" "),
                          Text("(", style: TextStyles.txtRegular15.copyWith(color: clrWhite,)),
                          Text("40+", style: TextStyles.txtRegular15.copyWith(color: clrWhite, decoration: TextDecoration.underline,  decorationStyle: TextDecorationStyle.solid, decorationThickness: 2),),
                          Text(")", style: TextStyles.txtRegular15.copyWith(color: clrWhite,)),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    decoration: BoxDecoration(
                        color: clrWhite,
                        borderRadius: BorderRadius.circular(20.r)
                    ),
                    child: Row(
                      children: [
                        Image.asset(icDiscount),
                        SizedBox(width: 5.w,),
                        Text("Discounts/Offers",style: TextStyles.txtRegular11.copyWith(color: clrParrotGreen,fontWeight: fwMedium,fontSize: 9.sp),),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height : 15.h),
              Container(
                height: 45.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: clrWhite,
                    borderRadius: BorderRadius.circular(30.r)
                ),
                child: widgetSearchTextField()
              ),
            ],
          ),
        ),
      ),
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
       onChanged: (str){

       },
       onSubmitted: (str){

       },
       style: TextStyles.txtRegular12.copyWith(color: clrTextFieldBorderColorByTheme()),
       textInputAction: TextInputAction.search,

       decoration: InputDecoration(
         border: InputBorder.none,
         isDense: true,
         prefixIcon: Image.asset(icSearch),
         contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
         hintText: "Key_Search".localized,
         hintStyle: TextStyles.txtRegular13.copyWith(color: clrTextFieldBorderColorByTheme()),
       ),
     ),
   );
 }

  List<String> modelList = [
    "assets/3dmodels/burger.glb",
    "assets/3dmodels/model1.glb",
    "assets/3dmodels/donut_strawberry_icing.glb",
    "assets/3dmodels/cake_with_cherry.glb",
    "assets/3dmodels/pizza.glb",
    "assets/3dmodels/cupcake.glb",
  ];

  List<String> imageList = [
    "assets/images/burger.png",
    "assets/images/non-veg-burger.jpeg",
    "assets/images/donut.png",
    "assets/images/cupcake.png",
    "assets/images/pizza.jpg",
    "assets/images/cupcake.jpeg"
  ];

  List<String> nameOfFood = [
    "Burger Veg",
    "Burger Non-veg",
    "Strawberry Donut",
    "Cherry Cake ",
    "Pizza",
    "Cupcake"
  ];
  
  Widget bodyWidget(){
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context,i){
      return InkWell(
        onTap: (){
          Route route = SlideRightPageRoute(builder: (context) => DetailsScreen(foodName: nameOfFood[i], foodModel: modelList[i]), settings: const RouteSettings());
          Navigator.push(context, route);
        },
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Column(
                              children: [
                                Image.asset(imageList[i], height: 80.h,width: 80.h,fit: BoxFit.cover,),
                              ],
                            )
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 5.w,),
                              Image.asset(i == 1 ? icNonVeg : icVeg, height: 25.h, width: 25.h,),
                              Text(nameOfFood[i], style: TextStyles.txtRegular14,),
                              const Spacer(),
                              Image.asset(icAdd, height: 30.h,width: 56.w,),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: 15.w,),
                              Text("INR 400.00",style: TextStyles.txtRegular12.copyWith(color: clrBaseGrey,decoration: TextDecoration.lineThrough ,decorationStyle: TextDecorationStyle.solid, decorationThickness: 2),),
                              SizedBox(width: 15.w,),
                              Text("INR 350.00",style: TextStyles.txtRegular12.copyWith(color: clrParrotGreen,),),

                            ],
                          ),
                          Visibility(
                            visible: i == 0,
                            child: Row(
                              children: [
                                SizedBox(width: 15.w,),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                                  decoration: BoxDecoration(
                                    color: clrParrotGreen,
                                    borderRadius: BorderRadius.circular(10.r)
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(icNoOnionGarlic),
                                      SizedBox(width: 5.w,),
                                      Text("No Onion Garlic",style: TextStyles.txtRegular11.copyWith(color: clrWhite,fontSize: 9.sp),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(width: 15.w,),
                              Expanded(child: Text("Enjoy a double decker big mac (L) + Fries (L) Drink of your choice(L).",overflow: TextOverflow.clip,style: TextStyles.txtRegular12.copyWith(fontSize: 10.sp))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),




              ],
            ),
          ),
        ),
      );
    },
    separatorBuilder: (context, index){
      return SizedBox(height: 10.h,);
    }, itemCount: imageList.length,);
  }
}
