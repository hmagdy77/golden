import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_color_manger.dart';
import '../../../core/constants/app_sizes.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {Key? key,
      this.child,
      required this.label,
      required this.ontap,
      required this.icon})
      : super(key: key);

  final String label;
  final VoidCallback ontap;
  final Widget? child;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: AppSizes.w4,
        height: AppSizes.h3,
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
        decoration: BoxDecoration(
          color: AppColorManger.backdark,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppSizes.h02),
            bottomRight: Radius.circular(AppSizes.h02),
            topLeft: Radius.circular(AppSizes.h02),
          ),
        ),
        child: Center(
          child: child ??
              ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      textAlign: TextAlign.center,
                      style: context.textTheme.displayMedium!
                          .copyWith(color: AppColorManger.lightScaffold),
                    ),
                    SizedBox(
                      height: AppSizes.h02,
                    ),
                    Icon(
                      icon,
                      color: AppColorManger.primary,
                      size: AppSizes.h08,
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
