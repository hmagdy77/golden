import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../core/service/services.dart';
import '../../core/constants/app_color_manger.dart';
import '../../core/constants/app_strings.dart';

abstract class MainController extends GetxController {
  onPageChange(int value);
}

class MainControllerImp extends MainController {
  MyService myService = Get.find();
  late PageController pageController;
  var currentIndex = 0.obs;
  final List titles = [
    AppStrings.golden,
    AppStrings.goldenOffers,
    AppStrings.goldenNews,
    AppStrings.golden,
  ].obs;

  // final List screens =
  //     [HomeScreen(), OffersScreen(), NewsScreen(), ActivtiesScreen()].obs;

  final List<GButton> tabs = [
    GButton(
      icon: Icons.home,
      text: AppStrings.home,
      iconColor: AppColorManger.primary,
      iconActiveColor: AppColorManger.primary,
      textStyle:
          Get.textTheme.displaySmall!.copyWith(color: AppColorManger.primary),
    ),
    GButton(
      icon: Icons.percent,
      text: AppStrings.offers,
      iconColor: AppColorManger.primary,
      iconActiveColor: AppColorManger.primary,
      textStyle:
          Get.textTheme.displaySmall!.copyWith(color: AppColorManger.primary),
    ),
    GButton(
      icon: Icons.newspaper,
      text: AppStrings.agentArea,
      iconColor: AppColorManger.primary,
      iconActiveColor: AppColorManger.primary,
      textStyle:
          Get.textTheme.displaySmall!.copyWith(color: AppColorManger.primary),
    ),
    GButton(
      icon: Icons.sports_gymnastics,
      text: AppStrings.agentArea,
      iconColor: AppColorManger.primary,
      iconActiveColor: AppColorManger.primary,
      textStyle:
          Get.textTheme.displaySmall!.copyWith(color: AppColorManger.primary),
    ),
  ];

  @override
  onPageChange(int value) {
    currentIndex.value = value;
    pageController.jumpToPage(value);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }
}
