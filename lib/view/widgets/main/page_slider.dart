// import 'package:flutter/material.dart';

// import '../../../controllers/main/main_screen_controller.dart';
 
// class PageSliderScreen extends StatelessWidget {
//   const PageSliderScreen({Key? key, required this.mainController})
//       : super(key: key);
//   final MainControllerImp mainController;
//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       controller: mainController.pageController,
//       itemCount: mainController.screens.length,
//       itemBuilder: (context, index) {
//         return mainController.screens[mainController.currentIndex.value];
//       },
//       onPageChanged: (index) {
//         mainController.onPageChange(index);
//       },
//     );
//   }
// }
