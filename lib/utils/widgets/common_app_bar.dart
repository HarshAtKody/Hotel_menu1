import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hotel_menu1/utils/const.dart';
import 'package:hotel_menu1/utils/theme_const.dart';


class CommonAppBar extends ConsumerWidget with Constant implements PreferredSizeWidget {
  String title;
  String subTitle;
  Function()? onLeadingPress;
  Function()? onDrawerTap;
  bool isTitleCenter = true;
  bool isLeading = true;
  bool isDrawer = false;
  bool isCenterWidget = false;
  final List<Widget>? action;
  final AppBar appBar;
  final Color? bgColor;
  final Color? titleColor;
  final Color? drawerColor;
  final Color? leadingColor;
  final Widget? centerWidget;


  CommonAppBar(
      {Key? key,
        required this.appBar,
        required this.title,
        this.subTitle = "",
        this.onLeadingPress,
        this.onDrawerTap,
        this.isTitleCenter = true,
        this.isLeading = true,
        this.isDrawer = false,
        this.isCenterWidget = false,
        this.action,
        this.bgColor,
        this.titleColor,
        this.leadingColor,
        this.centerWidget,
        this.drawerColor,
      }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final addressWatch = ref.watch(addAddressProvider);
    return AppBar(
      toolbarHeight: 200.h,
      centerTitle: isTitleCenter,
      //brightness: Platform.isIOS ? Brightness.light : null,
      leading: isLeading
          ? isDrawer
          ? InkWell(
          onTap: onDrawerTap ?? (){
            ZoomDrawer.of(context)?.toggle.call();
            hideKeyboard(context);
          },
          child: Image.asset(icBack,color: drawerColor?? clrTextByTheme(),))
          : IconButton(icon: Icon((getAppLanguage() == "ar")
          ? Icons.chevron_right_rounded
          : Icons.chevron_left_rounded, color: leadingColor??clrImageColorByTheme(), size: 30.h,),
          // icon: Image.asset(icLogo,color: clrTextByTheme(),),
          onPressed: onLeadingPress ?? () {
                hideKeyboard(context);
                Navigator.pop(context);
              }) : const Offstage(),
      elevation: 0,
      actions: action,
      backgroundColor: bgColor ?? clrScaffoldBGByTheme(),
      title: isCenterWidget
          ? centerWidget : Text(title, style: TextStyles.txtMedium18.copyWith(color: titleColor ?? clrTextByTheme())),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
