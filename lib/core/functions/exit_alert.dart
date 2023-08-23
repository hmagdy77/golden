import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/main/main_screen_controller.dart';
import '../../routes.dart';
import '../../view/widgets/admin/dialouge.dart';
import '../../view/widgets/images/my_logo.dart';
import '../constants/app_sizes.dart';
import '../constants/app_strings.dart';

Future<bool> exitAllert(BuildContext context) {
  final MainControllerImp mainController = Get.find<MainControllerImp>();
  if (mainController.currentIndex.value != 0) {
    mainController.onPageChange(0);
  } else {
    myDialuge(
      confirm: () {
        Get.back();
      },
      cancel: () {
        exit(0);
      },
      title: AppStrings.exitFromApp,
      middleText: '',
      content: SizedBox(
          width: AppSizes.w3, height: AppSizes.h1, child: const MyLogo()),
    );
  }
  return Future.value(false);
}

Future<bool> backWithOff(BuildContext context) {
  Get.offAllNamed(AppRoutes.mainScreen);
  return Future.value(false);
}
