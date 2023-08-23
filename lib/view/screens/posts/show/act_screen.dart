import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/posts/posts_controller.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../routes.dart';
import '../../../widgets/lottie/empty.dart';
import '../../../widgets/lottie/loading.dart';
import '../../../widgets/posts/post_item.dart';

class ActScreen extends StatelessWidget {
  ActScreen({super.key});
  final PostsControllerImp postsController = Get.put(PostsControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.activties),
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
          if (postsController.isLoading.value) {
            return const MyLottieLoading();
          } else if (postsController.activties.isEmpty) {
            return const MyLottieEmpty();
          } else {
            return Container(
              color: context.theme.scaffoldBackgroundColor,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: AppSizes.h5),
                      itemCount: postsController.activties.length,
                      itemBuilder: (context, index) {
                        var act = postsController.activties[index];
                        return PostItem(
                          post: act,
                        );
                      },
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
