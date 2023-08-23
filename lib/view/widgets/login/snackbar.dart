import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:goldengym/core/constants/app_sizes.dart';

class MySnackBar {
  static SnackbarController snack(String title, String message) {
    return Get.rawSnackbar(
        titleText: Center(
          child: Text(
            message,
            // style: GoogleFonts.lato(
            //     textStyle: TextStyle(
            //         color: Get.theme.primaryColorDark, fontSize: AppSizes.h02)),
          ),
        ),
        messageText: Center(
          child: Text(
            title,
            // style: GoogleFonts.lato(
            //     textStyle: TextStyle(
            //         color: Get.theme.primaryColorDark,
            //         fontSize: Sizes.height * .02)
            //         ),
          ),
        ),
        backgroundColor: Get.theme.primaryColor,
        duration: const Duration(seconds: 2),
        borderRadius: 10);
  }
}
