import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/images/images_controller.dart';
import '../../../controllers/posts/posts_controller.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/functions/valid_input.dart';
import '../../../data/models/posts_model.dart';
import '../../../data/remote/api.dart';
import '../../widgets/admin/dialouge.dart';
import '../../widgets/images/my_image_container.dart';
import '../../widgets/lottie/empty.dart';
import '../../widgets/lottie/loading.dart';
import '../../widgets/public/my_button.dart';
import '../../widgets/text_fields/my_text_field.dart';

class EditPostScreen extends StatelessWidget {
  EditPostScreen({super.key});
  final Post post = Get.arguments[0];
  final int kind = Get.arguments[1];
  final PostsControllerImp postsController = Get.find<PostsControllerImp>();
  final ImagesControllerImp imagesController = Get.find<ImagesControllerImp>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: kind == 1
            ? const Text(AppStrings.activtiesEdit)
            : kind == 2
                ? const Text(AppStrings.goldenOffers)
                : kind == 3
                    ? const Text(AppStrings.goldenNews)
                    : const Text(AppStrings.allerts),
      ),
      body: Obx(
        () {
          if (postsController.isLoading.value) {
            return const MyLottieLoading();
          } else if (imagesController.isLoading.value) {
            return const MyLottieLoading();
          } else {
            return Form(
              key: postsController.editPostKey,
              child: Padding(
                padding: EdgeInsets.all(AppSizes.w02),
                child: Column(
                  children: [
                    //  images
                    post.kind == '1' || post.kind == '4'
                        ? SizedBox(
                            height: AppSizes.h1,
                          )
                        : imagesController.postImages.isEmpty
                            ? SizedBox(
                                height: AppSizes.h2,
                                child: const MyLottieEmpty())
                            : Expanded(
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: AppSizes.h2),
                                  itemCount: imagesController.postImages.length,
                                  itemBuilder: (context, index) {
                                    var image =
                                        imagesController.postImages[index];
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
                                                '${Api.viewOneImage}/${imagesController.postImages[index].name}'),
                                      ),
                                    );
                                  },
                                ),
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
                    post.kind == '1' || post.kind == '4'
                        ? const SizedBox()
                        : MyTextField(
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
                      maxLines: post.kind == '1' || post.kind == '4'
                          ? 5
                          : post.kind == '3'
                              ? 3
                              : 1,
                    ),
                    // for height
                    SizedBox(
                      height: AppSizes.h05,
                    ),
                    // startAt && endAt && postKind
                    post.kind == '1'
                        ? const SizedBox()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    post.kind == '3'
                                        ? Row(
                                            children: [
                                              MyButton(
                                                text: AppStrings.publishDate,
                                                widget: const Icon(
                                                    Icons.calendar_month),
                                                onPressed: () {
                                                  postsController.setPostDate(
                                                    context: context,
                                                    start: false,
                                                  );
                                                },
                                              ),
                                              Text(
                                                '${AppStrings.publishDate} : ${postsController.formatter.format(post.end)}',
                                                style: context
                                                    .textTheme.displayLarge,
                                              ),
                                            ],
                                          )
                                        : post.kind == '2'
                                            ? Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      MyButton(
                                                        text: AppStrings.start,
                                                        widget: const Icon(Icons
                                                            .calendar_month),
                                                        onPressed: () {
                                                          postsController
                                                              .setPostDate(
                                                            context: context,
                                                            start: true,
                                                          );
                                                        },
                                                      ),
                                                      Text(
                                                        '${AppStrings.startAt} : ${postsController.formatter.format(post.start)}',
                                                        style: context.textTheme
                                                            .displayLarge,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      MyButton(
                                                        text: AppStrings.endAt,
                                                        widget: const Icon(Icons
                                                            .calendar_month),
                                                        onPressed: () {
                                                          postsController
                                                              .setPostDate(
                                                            context: context,
                                                            start: false,
                                                          );
                                                        },
                                                      ),
                                                      Text(
                                                        '${AppStrings.endAt} : ${postsController.formatter.format(post.end)}',
                                                        style: context.textTheme
                                                            .displayLarge,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : post.kind == '4'
                                                ? Row(
                                                    children: [
                                                      MyButton(
                                                        text: AppStrings.endAt,
                                                        widget: const Icon(Icons
                                                            .calendar_month),
                                                        onPressed: () {
                                                          postsController
                                                              .setPostDate(
                                                            context: context,
                                                            start: false,
                                                          );
                                                        },
                                                      ),
                                                      Text(
                                                        '${AppStrings.endAt} : ${postsController.formatter.format(post.end)}',
                                                        style: context.textTheme
                                                            .displayLarge,
                                                      ),
                                                    ],
                                                  )
                                                : const SizedBox()
                                  ],
                                ),
                              ),
                            ],
                          ),
                    // for height
                    SizedBox(
                      height: AppSizes.h05,
                    ),
                    //  Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        post.kind == '1' || post.kind == '4'
                            ? const SizedBox()
                            : MyButton(
                                width: AppSizes.w4,
                                text: AppStrings.addImage,
                                onPressed: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles();
                                  if (result != null) {
                                    imagesController.file =
                                        File(result.files.single.path!);

                                    if (post.kind == '2') {
                                      imagesController.imageKind.value =
                                          'o${post.id}';
                                    } else {
                                      imagesController.imageKind.value =
                                          'n${post.id}';
                                    }
                                    imagesController.addImage();
                                  } else {}
                                },
                              ),
                        MyButton(
                          width: AppSizes.w4,
                          text: AppStrings.edit,
                          onPressed: () {
                            postsController.editPost(post: post);
                          },
                        ),
                        MyButton(
                          width: AppSizes.w4,
                          text: AppStrings.delete,
                          onPressed: () {
                            myDialuge(
                              confirm: () {
                                if (post.kind == '2' || post.kind == '3') {
                                  // for (int i = 0;
                                  //     i < imagesController.postImages.length;
                                  //     i++) {
                                  //   imagesController.deleteImage(
                                  //       image: imagesController.postImages[i]);
                                  // }
                                  imagesController.deleteGroupImages(
                                      images: imagesController.postImages);
                                  postsController.deletePost(post: post);
                                } else {
                                  postsController.deletePost(post: post);
                                }
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
