import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../controllers/images/images_controller.dart';
import '../../../core/constants/app_color_manger.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../data/remote/api.dart';
import '../../../routes.dart';
import '../../widgets/admin/dialouge.dart';
import '../../widgets/images/my_image_container.dart';
import '../../widgets/login/snackbar.dart';
import '../../widgets/lottie/loading.dart';
import '../../widgets/public/my_button.dart';

// add_image_screen//
class AddImageScreen extends StatelessWidget {
  AddImageScreen({super.key});
  final ImagesControllerImp imagesController = Get.find<ImagesControllerImp>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.addImage),
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed(AppRoutes.mainScreen);
          },
          icon: const Icon(
            Icons.home,
          ),
        ),
      ),
      body: Obx(
        () {
          if (imagesController.isLoading.value) {
            return const MyLottieLoading();
          } else {
            return Container(
              color: context.theme.scaffoldBackgroundColor,
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.w05,
                horizontal: AppSizes.h05,
              ),
              child: Column(
                children: [
                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${AppStrings.imageKind} : ',
                        style: context.textTheme.displayLarge,
                      ),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: Text(imagesController.selectedKind.value,
                                style: context.textTheme.displayMedium),
                            items: imagesController.kindList
                                .map(
                                  (kind) => DropdownMenuItem<String>(
                                    value: kind,
                                    child: Text(
                                      kind,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              imagesController.selectedKind.value =
                                  value.toString();
                              switch (value) {
                                case AppStrings.sliderImages:
                                  imagesController.imageKind.value = '1';
                                  break;
                                case AppStrings.gallery:
                                  imagesController.imageKind.value = '2';
                                  break;
                              }
                            },
                          ),
                        ),
                      ),
                      MyButton(
                        width: AppSizes.w4,
                        text: AppStrings.choeseImage,
                        onPressed: () async {
                          if (imagesController.files != null) {
                            imagesController.files!.clear();
                          }
                          FilePickerResult? result = await FilePicker.platform
                              .pickFiles(allowMultiple: true);
                          if (result != null) {
                            imagesController.files = result.paths
                                .map((path) => File(path!))
                                .toList();
                          } else {
                            // User canceled the picker
                          }
                          // FilePickerResult? result =
                          //     await FilePicker.platform.pickFiles();
                          // if (result != null) {
                          //   imagesController.file =
                          //       File(result.files.single.path!);
                          // } else {}
                        },
                      ),
                      MyButton(
                        width: AppSizes.w4,
                        text: AppStrings.addImage,
                        onPressed: () {
                          if (imagesController.files == null) {
                            MySnackBar.snack(AppStrings.pleaseChoeseImage, '');
                          } else if (imagesController.imageKind.isEmpty) {
                            MySnackBar.snack(AppStrings.choseImageKind, '');
                          } else {
                            imagesController.addGroupImages();
                          }
                        },
                      ),
                    ],
                  ),
                  // for height
                  SizedBox(
                    height: AppSizes.h05,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        AppStrings.sliderImages,
                        style: context.textTheme.bodySmall,
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      Text(
                        AppStrings.gallery,
                        style: context.textTheme.bodySmall,
                      ),
                      const Spacer(),
                    ],
                  ),
                  // for height
                  SizedBox(
                    height: AppSizes.h05,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: AppSizes.h2),
                            itemCount: imagesController.sliderImages.length,
                            itemBuilder: (context, index) {
                              var image = imagesController.sliderImages[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    myDialuge(
                                      confirm: () {
                                        imagesController.deleteImage(
                                          image: image,
                                        );
                                      },
                                      cancel: () {
                                        Get.back();
                                      },
                                      title: AppStrings.confirmDelete,
                                      middleText: '',
                                    );
                                  },
                                  child: MyImageContainer(
                                      url:
                                          '${Api.viewOneImage}/${imagesController.sliderImages[index].name}'),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.w01,
                          ),
                          child: VerticalDivider(
                            width: 2,
                            thickness: 2,
                            color: AppColorManger.black,
                          ),
                        ),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: AppSizes.h2),
                            itemCount: imagesController.galleryImages.length,
                            itemBuilder: (context, index) {
                              var image = imagesController.galleryImages[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    myDialuge(
                                      confirm: () {
                                        imagesController.deleteImage(
                                          image: image,
                                        );
                                      },
                                      cancel: () {
                                        Get.back();
                                      },
                                      title: AppStrings.confirmDelete,
                                      middleText: '',
                                    );
                                  },
                                  child: MyImageContainer(
                                      url:
                                          '${Api.viewOneImage}/${imagesController.galleryImages[index].name}'),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
