// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../controllers/theme/theme_controller.dart';
// import '../../../core/constants/app_color_manger.dart';
// import '../../../core/constants/app_strings.dart';
// import '../../../routes.dart';
// import 'drawer_item.dart';

// class DrawerColumn extends StatelessWidget {
//   const DrawerColumn({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // padding: const EdgeInsets.all(10),
//       color: context.theme.primaryColorDark,
//       child: ListView(
//         children: [
//           DrawerItem(
//             label: AppStrings.addPost,
//             ontap: () {
//               Get.toNamed(
//                 AppRoutes.addPostScreen,
//               );
//             },
//           ),
//           DrawerItem(
//             label: AppStrings.addImage,
//             ontap: () {
//               Get.toNamed(
//                 AppRoutes.addImageScreen,
//               );
//             },
//           ),
//           DrawerItem(
//             label: AppStrings.addVideo,
//             ontap: () {
//               Get.toNamed(
//                 AppRoutes.addVideoScreen,
//               );
//             },
//           ),
//           DrawerItem(
//             label: AppStrings.news,
//             ontap: () {
//               Get.toNamed(
//                 AppRoutes.newsScreen,
//               );
//             },
//           ),
//           DrawerItem(
//             label: AppStrings.offers,
//             ontap: () {
//               Get.toNamed(
//                 AppRoutes.offersScreen,
//               );
//             },
//           ),
//           DrawerItem(
//             label: AppStrings.activties,
//             ontap: () {
//               Get.toNamed(AppRoutes.activtiesScreen);
//             },
//           ),
//           DrawerItem(
//             label: AppStrings.requests,
//             ontap: () {
//               Get.toNamed(AppRoutes.requestsScreen);
//             },
//           ),
//           DrawerItem(
//             label: AppStrings.themeMode,
//             ontap: () {},
//             child: SwitchListTile(
//               activeColor: AppColorManger.primary,
//               value: ThemeController().getDataFromBox(),
//               onChanged: (value) {
//                 ThemeController().changeTheme();
//               },
//               title: Text(
//                 AppStrings.themeMode,
//                 textAlign: TextAlign.center,
//                 style: context.textTheme.displayMedium!
//                     .copyWith(color: AppColorManger.lightScaffold),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
