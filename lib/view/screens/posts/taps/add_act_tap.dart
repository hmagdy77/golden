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

class AddActTap extends StatelessWidget {
  AddActTap({super.key});
  final PostsControllerImp postsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (postsController.isLoading.value) {
          return const MyLottieLoading();
        } else {
          return Form(
            key: postsController.addActKey,
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
                    AppStrings.addAct,
                    style: context.textTheme.bodyMedium,
                  ),
                  // for height
                  SizedBox(
                    height: AppSizes.h1,
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
                    maxLines: 6,
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
                          } else {
                            postsController.addAct();
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
