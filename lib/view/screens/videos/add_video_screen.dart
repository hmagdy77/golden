import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/videos/videos_controller.dart';
import '../../../core/constants/app_color_manger.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/functions/valid_input.dart';
import '../../../routes.dart';
import '../../widgets/admin/dialouge.dart';
import '../../widgets/lottie/loading.dart';
import '../../widgets/public/my_button.dart';
import '../../widgets/public/my_container.dart';
import '../../widgets/text_fields/my_text_field.dart';

class AddVideoScreen extends StatelessWidget {
  AddVideoScreen({super.key});
  final VideosControllerImp videosController = Get.put(VideosControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.viedosLibrary),
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
          if (videosController.isLoading.value) {
            return const MyLottieLoading();
          } else {
            return Form(
              key: videosController.addVideoKey,
              child: Container(
                color: context.theme.scaffoldBackgroundColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Column(
                  children: [
                    // for height
                    SizedBox(
                      height: AppSizes.h1,
                    ),
                    // url
                    MyTextField(
                      controller: videosController.url,
                      hidePassword: false,
                      validate: (val) {
                        return validInput(
                          max: 240,
                          min: 1,
                          type: AppStrings.validateAdmin,
                          val: val,
                        );
                      },
                      preIcon: const Icon(Icons.link),
                      label: AppStrings.videoUrl,
                      onSubmite: (v) {},
                    ),
                    // for height
                    SizedBox(
                      height: AppSizes.h02,
                    ),
                    MyButton(
                      text: AppStrings.addVideo,
                      onPressed: () {
                        videosController.addVideo();
                      },
                    ),
                    // for height
                    SizedBox(
                      height: AppSizes.h02,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: videosController.videosList.length,
                        itemBuilder: (context, index) {
                          var video = videosController.videosList[index];
                          return MyContainer(
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(video.url),
                                MyButton(
                                  color: AppColorManger.backlight,
                                  text: AppStrings.delete,
                                  onPressed: () {
                                    myDialuge(
                                      confirm: () {
                                        videosController.deleteVideo(
                                            id: video.id);
                                      },
                                      cancel: () {
                                        Get.back();
                                      },
                                      title: AppStrings.confirmDelete,
                                      middleText: '',
                                    );
                                  },
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
