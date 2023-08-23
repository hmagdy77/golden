import '../../../libraries.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ImagesControllerImp imagesController = Get.find<ImagesControllerImp>();
  final PostsControllerImp postsController = Get.find<PostsControllerImp>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (imagesController.isLoading.value ||
            postsController.isLoading.value) {
          return const MyLottieLoading();
        } else {
          return Container(
            color: context.theme.scaffoldBackgroundColor,
            child: ListView(
              children: [
                imagesController.sliderImages.isEmpty
                    ? SizedBox(
                        height: AppSizes.h03,
                      )
                    : SizedBox(height: AppSizes.h25, child: MyImagesSlider()),
                // Our Goal Text
                SizedBox(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppStrings.ourGoal,
                              style: context.textTheme.bodySmall),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            AppStrings.best,
                            style: context.textTheme.bodySmall!
                                .copyWith(color: AppColorManger.primary),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppStrings.sportsAcademy,
                              style: context.textTheme.bodySmall),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            AppStrings.egypt,
                            style: context.textTheme.bodySmall!
                                .copyWith(color: AppColorManger.primary),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // for height
                SizedBox(
                  height: AppSizes.h02,
                ),
                // goldenIdentification
                ContainerMi(
                  color: AppColorManger.backdark,
                  content: Text(
                    AppStrings.goldenHomeScript,
                    style: context.textTheme.displayMedium!
                        .copyWith(color: AppColorManger.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                // for height
                SizedBox(
                  height: AppSizes.h02,
                ),
                // activties label
                Text(
                  AppStrings.goldenActivties,
                  style: context.textTheme.displayMedium!,
                  // .copyWith(color: AppColorManger.primary),
                  textAlign: TextAlign.center,
                ),
                // for height
                SizedBox(
                  height: AppSizes.h01,
                ),
                // activties
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.w01,
                  ),
                  child: postsController.activties.isEmpty
                      ? Column(
                          children: [
                            const MyLottieInternet(),
                            SizedBox(
                              height: AppSizes.h03,
                            ),
                          ],
                        )
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: AppSizes.h17,
                            mainAxisExtent: AppSizes.h16,
                            mainAxisSpacing: AppSizes.h01,
                            crossAxisSpacing: AppSizes.w01,
                          ),
                          // scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: postsController.activties.length,
                          itemBuilder: (context, index) {
                            var act = postsController.activties[index];
                            return ActivtyItem(
                              post: act,
                            );
                          },
                        ),
                ),
                // for height
                SizedBox(
                  height: AppSizes.h01,
                ),
                // canKnowTimes
                ContainerMi(
                  color: AppColorManger.backdark,
                  content: Column(
                    children: [
                      Text(
                        AppStrings.canKnowTimes,
                        textAlign: TextAlign.center,
                        style: context.textTheme.displayMedium!
                            .copyWith(color: AppColorManger.white),
                      ),
                      SizedBox(
                        height: AppSizes.h01,
                      ),
                      MyButton(
                        text: AppStrings.agentArea,
                        onPressed: () {
                          Get.toNamed(
                            AppRoutes.webView,
                            arguments: [
                              Api.agentAreaUrl,
                              AppStrings.agentArea,
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                //  for height
                SizedBox(
                  height: AppSizes.h02,
                ),
                // ContactGroup
                const ContactGroup(phone: true),
                //  for height
                SizedBox(
                  height: AppSizes.h01,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
