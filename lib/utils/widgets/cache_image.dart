import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel_menu1/utils/const.dart';
import 'package:hotel_menu1/utils/theme_const.dart';

// ignore: must_be_immutable
class CacheImage extends StatelessWidget with Constant {

  final String imageURL;
  final double height;
  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomLeftRadius;
  final double? bottomRightRadius;
  final double width;
  final bool? setPlaceHolder;
  final String? placeholderImage;
  final BoxFit? contentMode;

  CacheImage({Key? key, required this.imageURL, required this.height, required this.width, this.setPlaceHolder = true, this.placeholderImage, this.contentMode,this.bottomLeftRadius,this.bottomRightRadius,this.topLeftRadius,this.topRightRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (imageURL == "") ? Icon(Icons.error, color: clrDarkRed,) : CachedNetworkImage(
      imageUrl: imageURL,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(topLeftRadius ?? 0.0),topRight:  Radius.circular(topRightRadius ?? 0.0),bottomRight:  Radius.circular(bottomRightRadius ?? 0.0),bottomLeft:  Radius.circular(bottomLeftRadius ?? 0.0)),
          image: DecorationImage(
              image: imageProvider,
              fit: contentMode ?? BoxFit.fill,
              // colorFilter:ColorFilter.mode(Colors.red, BlendMode.colorBurn)
          ),
        ),
      ),
      placeholder: (context, url) {
        return Image.asset(
            placeholderImage ?? (isDarkMode? icAppIconWhite:icAppIcon),
          height: height,
          width: width,
        );
      },
      errorWidget: (context, url, error) => Icon(Icons.error, color: clrDarkRed,),
    );
  }
}
