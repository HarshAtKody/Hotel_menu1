// import 'package:flutter/material.dart';
// import 'package:flutter_offline/flutter_offline.dart';
// import 'package:hotel_menu1/utils/const.dart';
// import 'package:hotel_menu1/utils/theme_const.dart';
// import 'package:hotel_menu1/utils/widgets/empty_state_widget.dart';
//
//
// class NoInternetBuilder extends StatelessWidget with Constant{
//   final Widget child;
//   final bool showInternetWidget;
//   final Function()? onTap;
//
//   NoInternetBuilder({Key? key, required this.child, this.showInternetWidget = true, this.onTap}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return OfflineBuilder( debounceDuration: Duration.zero,
//         connectivityBuilder: (BuildContext context, ConnectivityResult connectivity, Widget child,) {
//           isInternetConnectionOn = !(connectivity == ConnectivityResult.none);
//         //  showLog("Is internet connection on - $isInternetConnectionOn");
//           if (connectivity == ConnectivityResult.none) {
//             showLog("NO INTERNET AVAILABLE");
//             if(!showInternetWidget){
//               return child;
//             }
//             else{
//               return noInterNetWidget(context);
//             }
//           }
//        ///   showLog("INTERNET IS AVAILABLE ");
//           return child;
//         },
//         child: child
//     );
//   }
//
//   Widget noInterNetWidget(BuildContext context){
//     return EmptyStateWidget(emptyStateFor: EmptyState.noInternet,onTap: onTap,);
//   }
// }
