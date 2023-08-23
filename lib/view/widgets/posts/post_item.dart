import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:glass/glass.dart';

import '../../../controllers/images/images_controller.dart';
import '../../../controllers/posts/posts_controller.dart';
import '../../../core/constants/app_color_manger.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../data/models/posts_model.dart';
import '../../../data/remote/api.dart';
import '../../../routes.dart';
import '../images/my_image.dart';

class PostItem extends StatelessWidget {
  PostItem({super.key, required this.post});
  final Post post;
  final PostsControllerImp postsController = Get.find();
  final ImagesControllerImp imagesController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        postsController.title.text = post.title.toString();
        postsController.header.text = post.header.toString();
        postsController.content.text = post.content.toString();
        switch (post.kind) {
          case '1':
            // case 1:
            Get.toNamed(AppRoutes.editPostScreen, arguments: [post, 1]);
            break;
          case '2':
            //  case 2:
            imagesController.getPostImages(postId: 'o${post.id}');
            Get.toNamed(AppRoutes.editPostScreen, arguments: [post, 2]);
            break;
          case '3':
            //  case 3:
            imagesController.getPostImages(postId: 'n${post.id}');
            Get.toNamed(AppRoutes.editPostScreen, arguments: [post, 3]);
            break;
          case '4':
            // case 1:
            Get.toNamed(AppRoutes.editPostScreen, arguments: [post, 4]);
            break;
        }
      },
      child: Container(
        margin: EdgeInsets.all(AppSizes.h01),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColorManger.primary,
          borderRadius: BorderRadius.circular(AppSizes.h03),
        ),
        child: Stack(
          children: [
            MyImage(
                url: '${Api.viewPostsImages}/${post.image}',
                height: AppSizes.h35,
                width: double.infinity // AppSizes.w2,
                ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.only(
                    right: AppSizes.w02,
                    left: AppSizes.w02,
                    bottom: AppSizes.h01,
                  ),
                  decoration: BoxDecoration(
                    // color: AppColorManger.backdark,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppSizes.h03),
                      bottomRight: Radius.circular(AppSizes.h03),
                    ), //
                  ),
                  child: Column(
                    children: [
                      Text(
                        post.title,
                        style: context.textTheme.displayLarge!
                            .copyWith(color: AppColorManger.backlight),
                      ),
                      // post.kind == '1'
                      post.kind == '1'
                          ? Container()
                          : Text(
                              post.header,
                              style: context.textTheme.displayMedium!
                                  .copyWith(color: AppColorManger.backlight),
                            ),
                      // post.kind == '1'
                      post.kind == '1'
                          ? Container()
                          :
                          // post.kind == '2'
                          post.kind == '2'
                              ? Row(
                                  children: [
                                    Text(
                                      '${AppStrings.startAt} ${postsController.formatter.format(post.start)}',
                                      style: context.textTheme.displayMedium!
                                          .copyWith(
                                              color: AppColorManger.backlight),
                                    ),
                                    const Spacer(),
                                    DateTime.now()
                                                .difference(post.end)
                                                .inDays ==
                                            0
                                        ? Text(
                                            AppStrings.finishToday,
                                            style: context
                                                .textTheme.displayMedium!
                                                .copyWith(
                                                    color: AppColorManger
                                                        .backlight),
                                          )
                                        : DateTime.now()
                                                    .difference(post.end)
                                                    .inDays <
                                                0
                                            ? Text(
                                                AppStrings.finished,
                                                style: context
                                                    .textTheme.displayMedium!
                                                    .copyWith(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color:
                                                      AppColorManger.backlight,
                                                ),
                                              )
                                            : DateTime.now()
                                                        .difference(post.end)
                                                        .inDays <
                                                    11
                                                ? Text(
                                                    '${AppStrings.stay} ${post.start.difference(post.end).inDays} ${AppStrings.days}',
                                                    style: context.textTheme
                                                        .displayMedium!
                                                        .copyWith(
                                                            color:
                                                                AppColorManger
                                                                    .backlight),
                                                  )
                                                : Text(
                                                    '${AppStrings.stay} ${DateTime.now().difference(post.end).inDays} ${AppStrings.day}',
                                                    style: context.textTheme
                                                        .displayMedium!
                                                        .copyWith(
                                                            color:
                                                                AppColorManger
                                                                    .backlight),
                                                  ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Text(
                                      '${AppStrings.puplised} ${postsController.formatter.format(post.start)}',
                                      style: context.textTheme.displayMedium!
                                          .copyWith(
                                              color: AppColorManger.backlight),
                                    )
                                  ],
                                )
                    ],
                  ),
                )
                // .asGlass(
                //   tintColor: Colors.transparent,
                //   clipBorderRadius: BorderRadius.circular(15.0),
                // ),
                ),
          ],
        ),
      ),
    );
  }
}
