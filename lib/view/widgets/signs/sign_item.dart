import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldenadmin/core/constants/app_color_manger.dart';
import 'package:goldenadmin/core/constants/app_sizes.dart';

import '../../../controllers/signs/signs_controller.dart';
import '../../../core/constants/app_strings.dart';
import '../../../data/models/signs_model.dart';
import '../admin/dialouge.dart';

class SignItem extends StatelessWidget {
  SignItem({super.key, required this.sign});
  final SignsControllerImp signsController = Get.find();
  final Sign sign;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: sign.seen == '1' ? AppColorManger.grey : AppColorManger.primary,
      ),
      child: Stack(
        children: [
          SelectionArea(
            focusNode: FocusNode(),
            selectionControls: desktopTextSelectionControls,
            child: sign.activty == '0'
                ? Column(
                    children: [
                      Text(
                        '${AppStrings.name} : ${sign.name}',
                        style: context.textTheme.displayMedium,
                      ),
                      Text(
                        '${AppStrings.phone} : ${sign.phone}',
                        style: context.textTheme.displayMedium,
                      ),
                      Text(
                        '${AppStrings.date} : ${sign.time}',
                        style: context.textTheme.displayMedium,
                      ),
                      Text(
                        '${AppStrings.sug} : ${sign.sug}',
                        style: context.textTheme.displayMedium,
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            '${AppStrings.name} : ${sign.name}',
                            style: context.textTheme.displayMedium,
                          ),
                          Text(
                            '${AppStrings.phone} : ${sign.phone}',
                            style: context.textTheme.displayMedium,
                          ),
                          Text(
                            '${AppStrings.actPost} : ${sign.activty}',
                            style: context.textTheme.displayMedium,
                          ),
                          Text(
                            '${AppStrings.gender} : ${sign.gender == '0' ? AppStrings.boy : AppStrings.girl}',
                            style: context.textTheme.displayMedium,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '${AppStrings.age} : ${sign.age}',
                            style: context.textTheme.displayMedium,
                          ),
                          sign.borthers == '1'
                              ? Text(
                                  AppStrings.hasBrothers,
                                  style: context.textTheme.displayMedium,
                                )
                              : Text(
                                  AppStrings.notHasBrothers,
                                  style: context.textTheme.displayMedium,
                                ),
                          sign.played == '1'
                              ? Text(
                                  AppStrings.hasPlayed,
                                  style: context.textTheme.displayMedium,
                                )
                              : Text(
                                  AppStrings.notHasPlayed,
                                  style: context.textTheme.displayMedium,
                                ),
                          sign.signed == '1'
                              ? Text(
                                  AppStrings.hasSigned,
                                  style: context.textTheme.displayMedium,
                                )
                              : Text(
                                  AppStrings.notHasSigned,
                                  style: context.textTheme.displayMedium,
                                ),
                          Text(
                            '${AppStrings.date} : ${sign.time}',
                            style: context.textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
          sign.seen == '1'
              ? Positioned(
                  bottom: 2,
                  left: 2,
                  right: 2,
                  top: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check,
                        size: AppSizes.h05,
                      ),
                      Icon(
                        Icons.check,
                        size: AppSizes.h05,
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          sign.activty == '0'
              ? Positioned(
                  top: 2,
                  left: 2,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          signsController.makeSeen(sign: sign);
                        },
                        icon: const Icon(Icons.check),
                      ),
                      IconButton(
                        onPressed: () {
                          myDialuge(
                            confirm: () {
                              signsController.deletSign(sign: sign);
                            },
                            cancel: () {
                              Get.back();
                            },
                            title: AppStrings.confirmDelete,
                            middleText: '',
                          );
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                )
              : Positioned(
                  bottom: 2,
                  right: 2,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          signsController.makeSeen(sign: sign);
                        },
                        icon: const Icon(Icons.check),
                      ),
                      IconButton(
                        onPressed: () {
                          myDialuge(
                            confirm: () {
                              signsController.deletSign(sign: sign);
                            },
                            cancel: () {
                              Get.back();
                            },
                            title: AppStrings.confirmDelete,
                            middleText: '',
                          );
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
