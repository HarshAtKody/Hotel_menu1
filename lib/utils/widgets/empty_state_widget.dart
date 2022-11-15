// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hotel_menu1/utils/extension/string_extension.dart';
// import 'package:hotel_menu1/utils/theme_const.dart';
// import 'package:hotel_menu1/utils/widgets/common_button.dart';
// import 'package:hotel_menu1/utils/widgets/show_up_transition.dart';
//
// class EmptyStateWidget extends StatelessWidget with Constant {
//   EmptyState emptyStateFor;
//   bool? isImageShow;
//   Function()? onTap;
//
//   EmptyStateWidget({Key? key, required this.emptyStateFor, this.isImageShow = true, this.onTap}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     String imgName = "";
//     String title = "";
//     String btnName = "";
//     String subTitle = "";
//     bool showBtn = false;
//     switch (emptyStateFor){
//       case EmptyState.noMuseumFound:
//         imgName = icEmptyMuseum;
//         title = "Key_NoMuseumFound".localized;
//         subTitle = "Key_NoMuseumFoundMSG".localized;
//         break;
//       case EmptyState.noBookmarkFound:
//         imgName = icEmptyBookmark;
//         title = "Key_NoBookmarkFound".localized;
//         subTitle = "Key_NoBookmarkFoundMSG".localized;
//         break;
//       case EmptyState.noAddBookmark:
//         imgName = icEmptyAddBookmark;
//         title = "Key_AddBookmark".localized;
//         subTitle = "Key_AddBookmarkMSG".localized;
//         break;
//       case EmptyState.noBooksAvailable:
//         imgName = icEmptyNoBooks;
//         title = "Key_NoBooksAvailable".localized;
//         subTitle = "Key_NoBooksAvailableMSG".localized;
//         break;
//       case EmptyState.noFriends:
//         showBtn = true;
//         btnName = "Key_AddFriends".localized;
//         imgName = icEmptyFriends;
//         title = "Key_NoFriends".localized;
//         subTitle = "Key_NoFriendsMSG".localized;
//         break;
//       case EmptyState.noRequest:
//         imgName = icEmptyRequest;
//         title = "Key_NoRequestFound".localized;
//         subTitle = "Key_NoRequestFoundMSG".localized;
//         break;
//       case EmptyState.noNews:
//         imgName = icEmptyNews;
//         title = "Key_NoNewsFound".localized;
//         subTitle = "Key_NoNewsFoundMSG".localized;
//         break;
//       case EmptyState.noInternet:
//         showBtn = true;
//         btnName = "Key_TryAgain".localized;
//         imgName = icNoInternet;
//         title = "Key_NoInternet".localized;
//         subTitle = "Key_NoInternetMSG".localized;
//         break;
//       case EmptyState.noTicket:
//         imgName = icEmptyTicket;
//         title = "Key_NoTicketFound".localized;
//         subTitle = "Key_NoTicketFoundMSG".localized;
//         break;
//       case EmptyState.noAvatarFound:
//         showBtn = true;
//         btnName = "Key_GoToAvatars".localized;
//         imgName = icEmptyAvatar;
//         title = "Key_NoAvtarFound".localized;
//         subTitle = "Key_NoAvtarFoundMSG".localized;
//         break;
//       case EmptyState.noNotificationFound:
//         imgName = icEmptyNotification;
//         title = "Key_NoNotificationFound".localized;
//         subTitle = "Key_NoNotificationFoundMSG".localized;
//         break;
//       case EmptyState.noFavourite:
//         imgName = icEmptyFavourite;
//         title = "Key_NoFavouriteFound".localized;
//         subTitle = "Key_NoFavouriteFoundMSG".localized;
//         break;
//       case EmptyState.noResultFound:
//         imgName = icEmptySearch;
//         title = "Key_NoResultFound".localized;
//         subTitle = "Key_NoResultFoundMSG".localized;
//         break;
//       case EmptyState.noSharedBookAvailable:
//         imgName = icEmptyShared;
//         title = "Key_NoSharedBookTitle".localized;
//         subTitle = "Key_NoSharedBooksMSG".localized;
//         break;
//       case EmptyState.noFriendAvailable:
//         imgName = icEmptyFriendList;
//         showBtn = true;
//         btnName = "Key_AddNow".localized;
//         title = "Key_NoCompanionTitle".localized;
//         subTitle = "Key_NoCompanionSubTitle".localized;
//         break;
//       default:
//         title = "Key_SomethingWentWrong".localized;
//         subTitle = "Key_SomethingWentWrong".localized;
//     }
//
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 40.w,vertical: 40.h),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             /// image
//             Visibility(
//               visible: isImageShow == true,
//               child: ShowUpTransition(
//                 delay: 150,
//                 child: Image.asset(imgName),
//               ),
//             ),
//             SizedBox(height: isImageShow == true? 70.h: 30.h),
//             /// title text
//             ShowUpTransition(
//               delay: 150,
//               child: Text(title, textAlign: TextAlign.center, style: TextStyles.txtBold20.copyWith(color:clrTextGreyByTheme())
//               ),
//             ),
//             SizedBox(height:20.h),
//             /// sub title
//             ShowUpTransition(
//               delay: 150,
//               child: Text(subTitle,
//                   textAlign: TextAlign.center,
//                   style:  TextStyles.txtRegular16.copyWith(color:clrTextDarkGreyByTheme())
//               ),
//             ),
//             Visibility(
//                 visible: showBtn,
//                 child: Padding(
//                   padding:  EdgeInsets.only(top:60.h,bottom: 20.h),
//                   child: CommonButton(label: btnName, onTap: onTap, bgColor: clrPrimary, labelColor: clrWhite),
//                 )),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// enum EmptyState{
//   noMuseumFound,
//   noBookmarkFound,
//   noAddBookmark,
//   noBooksAvailable,
//   noFriends,
//   noRequest,
//   noNews,
//   noInternet,
//   noTicket,
//   noAvatarFound,
//   noNotificationFound,
//   noFavourite,
//   noResultFound,
//   noSharedBookAvailable,
//   noFriendAvailable
// }
