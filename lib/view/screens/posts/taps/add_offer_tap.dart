import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

import '../../../../controllers/posts/posts_controller.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/functions/valid_input.dart';
import '../../../widgets/login/snackbar.dart';
import '../../../widgets/lottie/loading.dart';
import '../../../widgets/public/my_button.dart';
import '../../../widgets/text_fields/my_text_field.dart';

class AddOfferTap extends StatelessWidget {
  AddOfferTap({super.key});
  final PostsControllerImp postsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (postsController.isLoading.value) {
          return const MyLottieLoading();
        } else {
          return Form(
            key: postsController.addOfferKey,
            child: Container(
              color: context.theme.scaffoldBackgroundColor,
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.w05,
                horizontal: AppSizes.h05,
              ),
              child: Column(
                children: [
                  // label
                  Text(
                    AppStrings.addOffer,
                    style: context.textTheme.bodyMedium,
                  ),
                  // for height
                  SizedBox(
                    height: AppSizes.h05,
                  ),
                  // title
                  MyTextField(
                    controller: postsController.title,
                    hidePassword: false,
                    validate: (val) {
                      return validInput(
                        max: 240,
                        min: 1,
                        type: AppStrings.validateAdmin,
                        val: val,
                      );
                    },
                    preIcon: const Icon(Icons.title),
                    label: AppStrings.title,
                    onSubmite: (v) {},
                  ),
                  // for height
                  SizedBox(
                    height: AppSizes.h05,
                  ),
                  // header
                  MyTextField(
                    controller: postsController.header,
                    hidePassword: false,
                    validate: (val) {
                      return validInput(
                        max: 500,
                        min: 1,
                        type: AppStrings.validateAdmin,
                        val: val,
                      );
                    },
                    preIcon: const Icon(Icons.subtitles),
                    label: AppStrings.header,
                    onSubmite: (v) {},
                  ),
                  // for height
                  SizedBox(
                    height: AppSizes.h05,
                  ),
                  // content
                  MyTextField(
                    controller: postsController.content,
                    hidePassword: false,
                    validate: (val) {
                      return validInput(
                        max: 500,
                        min: 1,
                        type: AppStrings.validateAdmin,
                        val: val,
                      );
                    },
                    preIcon: const Icon(Icons.content_copy),
                    label: AppStrings.content,
                    onSubmite: (v) {},
                  ),
                  // for height
                  SizedBox(
                    height: AppSizes.h05,
                  ),
                  // startAt && endAt && postKind
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${AppStrings.startAt} : ${postsController.startDate.value}',
                              style: context.textTheme.displayLarge,
                            ),
                            const Spacer(),
                            Text(
                              '${AppStrings.endAt} : ${postsController.endDate.value}',
                              style: context.textTheme.displayLarge,
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // for height
                  SizedBox(
                    height: AppSizes.h05,
                  ),
                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyButton(
                        width: AppSizes.w4,
                        text: AppStrings.startDate,
                        onPressed: () {
                          postsController.setPostDate(
                              context: context, start: true);
                        },
                      ),
                      MyButton(
                        width: AppSizes.w4,
                        text: AppStrings.endDate,
                        onPressed: () {
                          postsController.setPostDate(
                              context: context, start: false);
                        },
                      ),
                      MyButton(
                        width: AppSizes.w4,
                        text: AppStrings.choeseImage,
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null) {
                            postsController.file =
                                File(result.files.single.path!);
                          } else {}
                        },
                      ),
                      MyButton(
                        width: AppSizes.w4,
                        text: AppStrings.add,
                        onPressed: () async {
                          if (postsController.file == null) {
                            MySnackBar.snack(AppStrings.pleaseChoeseImage, '');
                          } else if (postsController.startDate.value.isEmpty) {
                            MySnackBar.snack(AppStrings.chosePostStart, '');
                          } else if (postsController.endDate.value.isEmpty) {
                            MySnackBar.snack(AppStrings.chosePostEnd, '');
                          } else {
                            postsController.addOffer();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
