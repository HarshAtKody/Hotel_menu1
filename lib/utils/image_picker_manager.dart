import 'dart:io';
import 'package:hotel_menu1/utils/const.dart';
import 'package:hotel_menu1/utils/theme_const.dart';
import 'package:hotel_menu1/utils/widgets/common_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImagePickerManager with Constant {

  ImagePickerManager._privateConstructor();
  static final ImagePickerManager instance = ImagePickerManager._privateConstructor();

  ///Image options
  final List<String> _imageOptions = ["camera", "gallery"];

  ///Open Picker
  Future<File?> openPicker(BuildContext context, {double? ratioX, double? ratioY}) async {
    String type = await _imageOptionBottomSheet(context: context);

    File? croppedFile;
    if(type.isNotEmpty){
      XFile? fileProfile;

      if (_imageOptions.elementAt(0) == type) {
        fileProfile = (await ImagePicker().pickImage(source: ImageSource.camera));
      }
      else {
        fileProfile = (await ImagePicker().pickImage(source: ImageSource.gallery));
      }
      showLog("fileProfile: $fileProfile");

      if(fileProfile != null && fileProfile.path != "") {
        CroppedFile? cropImage = (await ImageCropper().cropImage(
          sourcePath: fileProfile.path,
          aspectRatio: CropAspectRatio(ratioX: ratioX ?? 1, ratioY: ratioY ?? 1),
        ));

        if(cropImage != null && cropImage.path != "") {
          croppedFile = File(cropImage.path);
        }
      }
    }
    return croppedFile;
  }

  ///Image option bottom sheet
  Future<String> _imageOptionBottomSheet({context}) async {
    String str = "";

    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Center(
            child: Text( "Key_Select_Photo".tr(),
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w700)),
          ),
          children: <Widget>[
            SimpleDialogOption(
                child: CommonButton(label: "Key_Photo_With_Camera".tr(),
                    bgColor: Constant().clrTransparent,
                    labelColor: Constant().clrPrimary,
                    borderColor: Constant().clrPrimary,
                    borderRadius: 5.r,
                    onTap: (){
                      Navigator.pop(context);
                      str = _imageOptions.elementAt(0);
                    }
                ),
                onPressed: () async {
                  Navigator.pop(context);
                  str = _imageOptions.elementAt(0);
                }),
            SimpleDialogOption(
                child: CommonButton(label: "Key_Image_From_Gallery".tr(),
                    bgColor: Constant().clrTransparent,
                    labelColor: Constant().clrPrimary,
                    borderColor: Constant().clrPrimary,
                    borderRadius: 5.r,
                    onTap: (){
                      Navigator.pop(context);
                      str = _imageOptions.elementAt(1);
                    }
                ),
                onPressed: () async {
                  Navigator.pop(context);
                  str = _imageOptions.elementAt(1);
                }),
            SizedBox(
              height: 10.h,
            ),
            SimpleDialogOption(
              child: Center(
                  child: CommonButton(label: "Key_Cancel".tr(),
                      bgColor: Constant().clrPrimary,
                      labelColor: Constant().clrWhite,
                      // borderColor: Constant().clrPrimary,
                      borderRadius: 5.r,
                      onTap: (){
                        Navigator.pop(context);
                      }
                  )),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );

    /*await showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: clrDialogBGByTheme(),
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (context, state) {
                return Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.only(left: 29.w, right: 29.w),
                  height: 250.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: clrWhite,
                            borderRadius: BorderRadius.circular(30.r)),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                str = _imageOptions.elementAt(0);
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 30.h, bottom: 15.h),
                                alignment: Alignment.center,
                                child: Text(
                                  getLocalValue("Key_Photo_With_Camera"),
                                  style: TextStyles.txtSemiBold14.copyWith(color: clrBlack),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.w, right: 20.w),
                              child: Divider(height: 1, color: clrLightGrey,),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                str = _imageOptions.elementAt(1);
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 15.h, bottom: 30.h),
                                alignment: Alignment.center,
                                child: Text(
                                  getLocalValue("Key_Image_From_Gallery"),
                                  style: TextStyles.txtSemiBold14.copyWith(color: clrBlack),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50.h,
                          decoration: BoxDecoration(
                              color: (clrWhite),
                              borderRadius: BorderRadius.circular(22.r)
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            getLocalValue("Key_Cancel"),
                            style: TextStyles.txtSemiBold16.copyWith(color:  clrBlack),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
          );
        }
    );*/

    return str;
  }

}

/* Class usage
File? file = await ImagePickerManager.instance.openPicker(context);
*/
