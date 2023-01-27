import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_menu1/utils/const.dart';
import 'package:hotel_menu1/utils/theme_const.dart';
import 'package:hotel_menu1/utils/widgets/common_app_bar.dart';
import 'package:hotel_menu1/utils/widgets/common_button.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class DetailsScreen extends StatefulWidget {
  final String foodName;
  final String foodModel;
  const DetailsScreen({Key? key, required this.foodName, required this.foodModel}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}


class _DetailsScreenState extends State<DetailsScreen> with Constant{

    bool isChecked = false;
    final GlobalKey<ScaffoldState> detailsScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {

    });
    super.initState();
  }

  String js = r''' 
 const modelViewerTransform = document.querySelector("model-viewer#transform");
 modelViewerTransform.scale = `${0.1} ${0.1} ${0.1}`;
 modelViewerTransform.updateFraming();
   ''';

  int itemCount = 1;

  String html = r'''
   <div class="controls">
    <div>
      Scale: X: <input id="x" value="0.1" size="3" class="number">,
      Y: <input id="y" value="0.1" size="3" class="number">,
      Z: <input id="z" value="0.1" size="3" class="number">
    </div>
    <button id="frame">Update Framing</button>
  </div>
  ''';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: detailsScaffoldKey,
      backgroundColor: clrWhite,
      appBar: CommonAppBar(
        isLeading: true,
        bgColor: clrWhite,
        appBar: AppBar(),
        title: "Product Info",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250.h,
                width: double.infinity,
                child: ModelViewer(
                  loading: Loading.eager,
                  src: widget.foodModel,
                  autoRotate: false,
                  autoPlay: false,
                  rotationPerSecond: "50deg",
                  autoRotateDelay: 500,
                  cameraControls: true,
                  // innerModelViewerHtml: html,
                  ar: true,
                  arPlacement: ArPlacement.wall,
                  arScale: ArScale.auto,
                  // cameraTarget: "auto",
                  relatedJs: js,
                  // scale: '${0.001} ${0.001} ${0.001}',
                  disableZoom: true,
                  arModes: const ['scene-viewer', 'webxr', 'quick-look'],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      Image.asset(icVeg, height: 10.h, width: 10.h,),
                      SizedBox(width: 5.w,),
                      Text(widget.foodName,style: TextStyles.txtRegular14,),
                      const Spacer(),
                      Container(
                        height: 30.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          color: clrWhite,
                          borderRadius: BorderRadius.circular(30.r),
                          border: Border.all(color: clrParrotGreen),
                        ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 10.w,),
                              InkWell(
                                  onTap: (){
                                    setState(() {
                                      if(itemCount > 1){
                                        itemCount --;
                                      }
                                    });
                                    },
                                  child: Image.asset(icDelete, height: 18.h,width: 18.h,)),
                              const Spacer(),
                              Text("$itemCount"),
                              const Spacer(),
                              InkWell(
                                  onTap: (){
                                    setState(() {
                                      if(itemCount >= 1 && itemCount < 25){
                                      itemCount ++;
                                      }
                                    });
                                  },
                                  child: Icon(Icons.add, color: clrParrotGreen,size: 18.sp,)),
                              SizedBox(width: 10.w,),

                            ],
                          ),
                      )

                    ],
                  ),
                  SizedBox(height: 7.h,),
                  Row(
                    children: [
                      SizedBox(width: 15.w,),
                      Text("INR 400.00",style: TextStyles.txtRegular12.copyWith(color: clrBaseGrey,decoration: TextDecoration.lineThrough, decorationStyle: TextDecorationStyle.solid, decorationThickness: 2),),
                      SizedBox(width: 15.w,),
                      Text("INR 350.00",style: TextStyles.txtRegular12.copyWith(color: clrParrotGreen,),),

                    ],
                  ),
                  Divider(color: clrBaseGrey,),
                  Text('About Product',style: TextStyles.txtRegular12.copyWith(color: clrBaseGrey)),
                  SizedBox(height: 12.h,),
                  Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.duis dolore te feugait nulla facilisi.',style: TextStyles.txtRegular12,),
                  Divider(color: clrBaseGrey,),
                  Text('Product Type',style: TextStyles.txtRegular12.copyWith(color: clrBaseGrey)),
                  SizedBox(height: 5.h,),
                  Text('Resturant',style: TextStyles.txtRegular14,),
                  Divider(color: clrBaseGrey,),
                  Text('Customizes',style: TextStyles.txtRegular12.copyWith(color: clrBaseGrey)),
                  SizedBox(height: 5.h,),
                  Row(
                    children: [
                      InkWell(
                          onTap: (){
                            setState(() {
                              isChecked = !isChecked;
                            });},
                          child: Text('No Garlic, Onion',style: TextStyles.txtRegular14,)),
                      const Spacer(),
                      Checkbox(value: isChecked, onChanged: (value){
                        value = isChecked;
                      })
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical:20.h),
        child: CommonButton(
          onTap: (){
            showSnackBar(detailsScaffoldKey, "${widget.foodName} Added To Cart");
          },
          bgColor: clrBlack,
          label: 'ADD TO CART',
          labelColor: clrWhite,

        ),
      ),
    );
  }
}
