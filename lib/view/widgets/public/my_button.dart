import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/on_boarding/on_boarding_controller.dart';
import '../../../core/constants/app_color_manger.dart';
import '../../../core/constants/app_sizes.dart';

class MyButton extends GetView<OnBoardingImp> {
  const MyButton(
      {Key? key,
      this.widget,
      this.width,
      this.text,
      this.color,
      this.onPressed,
      this.minWidth})
      : super(key: key);
  final String? text;
  final bool? minWidth;
  final void Function()? onPressed;
  final Widget? widget;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: AppSizes.h06,
        width: width ?? AppSizes.w25,
        margin: const EdgeInsets.all(12),
        child: MaterialButton(
          minWidth: minWidth == true ? AppSizes.w25 : 0,
          onPressed: onPressed,
          color: color ?? AppColorManger.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: widget ??
              Text(
                text!,
                style: context.textTheme.displayMedium!.copyWith(
                  color: AppColorManger.backdark,
                ),
              ),
        ),
      ),
    );
  }
}
