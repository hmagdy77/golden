import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/images/images_controller.dart';
import '../../controllers/main/main_screen_controller.dart';
import '../../controllers/posts/posts_controller.dart';
// import '../../controllers/theme/theme_controller.dart';
import '../../core/constants/app_image_assets.dart';
import '../../core/constants/app_strings.dart';
import '../../routes.dart';
import '../widgets/drawer/drawer_item.dart';
import '../widgets/lottie/loading.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final MainControllerImp mainController = Get.put(MainControllerImp());
  final ImagesControllerImp imagesController = Get.find<ImagesControllerImp>();
  final PostsControllerImp postsController = Get.find<PostsControllerImp>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (imagesController.isLoading.value) {
          return const MyLottieLoading();
        } else {
          return Scaffold(
            // endDrawer: const Drawer(
            //   child: Expanded(child: DrawerColumn()),
            // ),
            appBar: AppBar(
              leading: const SizedBox(),
              title: Text(
                AppStrings.golden,
                style: context.textTheme.displayLarge,
              ),
              // actions: [
              //   IconButton(
              //       onPressed: () {
              //         // ThemeController().changeTheme();
              //       },
              //       icon: const Icon(Icons.sunny)),
              // ],
            ),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppImageAssets.logo,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DrawerItem(
                        label: AppStrings.addPost,
                        ontap: () {
                          postsController.title.clear();
                          postsController.content.clear();
                          postsController.header.clear();
                          Get.toNamed(
                            AppRoutes.addPostScreen,
                          );
                        },
                        icon: Icons.note_add,
                      ),
                      DrawerItem(
                        label: AppStrings.news,
                        ontap: () {
                          postsController.postsList.clear();
                          postsController.offers.clear();
                          postsController.activties.clear();
                          postsController.news.clear();
                          postsController.alerts.clear();
                          postsController.getPosts();
                          Get.offAllNamed(AppRoutes.newsScreen);
                        },
                        icon: Icons.notes,
                      ),
                      DrawerItem(
                        label: AppStrings.offers,
                        ontap: () {
                          postsController.postsList.clear();
                          postsController.offers.clear();
                          postsController.activties.clear();
                          postsController.news.clear();
                          postsController.alerts.clear();

                          postsController.getPosts();
                          Get.toNamed(AppRoutes.offersScreen);
                        },
                        icon: Icons.percent,
                      ),
                      DrawerItem(
                        label: AppStrings.activties,
                        ontap: () {
                          postsController.postsList.clear();
                          postsController.offers.clear();
                          postsController.activties.clear();
                          postsController.news.clear();
                          postsController.alerts.clear();
                          postsController.getPosts();
                          Get.toNamed(AppRoutes.actScreen);
                        },
                        icon: Icons.sports_football,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DrawerItem(
                          label: AppStrings.gallery,
                          ontap: () {
                            imagesController.allImages.clear();
                            imagesController.sliderImages.clear();
                            imagesController.galleryImages.clear();
                            imagesController.getImages();
                            Get.toNamed(AppRoutes.addImageScreen);
                          },
                          icon: Icons.add_a_photo),
                      DrawerItem(
                        label: AppStrings.viedosLibrary,
                        ontap: () {
                          Get.toNamed(
                            AppRoutes.addVideoScreen,
                          );
                        },
                        icon: Icons.video_file_sharp,
                      ),
                      DrawerItem(
                        label: AppStrings.requests,
                        ontap: () {
                          Get.toNamed(AppRoutes.signstsScreen);
                        },
                        icon: Icons.people,
                      ),
                      DrawerItem(
                        label: AppStrings.allerts,
                        ontap: () {
                          postsController.postsList.clear();
                          postsController.offers.clear();
                          postsController.activties.clear();
                          postsController.news.clear();
                          postsController.alerts.clear();
                          postsController.getPosts();
                          Get.toNamed(AppRoutes.alertsScreen);
                        },
                        icon: Icons.notifications,
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
