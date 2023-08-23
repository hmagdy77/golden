import 'package:flutter/material.dart';

import '../../../core/constants/app_color_manger.dart';
import '../../../core/constants/app_sizes.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key, required this.content});
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSizes.w01),
      padding: EdgeInsets.all(AppSizes.w01 / 2),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColorManger.primary,
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(AppSizes.h02),
        //   bottomLeft: Radius.circular(AppSizes.h02),
        //   topRight: Radius.circular(AppSizes.h02),
        // ),
        borderRadius: BorderRadius.circular(AppSizes.h02),
      ),
      child: content,
    );
  }
}
