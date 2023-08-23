import '../../../libraries.dart';

class AlertsScreen extends StatelessWidget {
  AlertsScreen({super.key});
  final PostsControllerImp postsController = Get.find<PostsControllerImp>();
  @override
  Widget build(BuildContext context) {
    var alert = postsController.alerts.first;
    return WillPopScope(
      onWillPop: () => backWithOff(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.golden),
          leading: IconButton(
            onPressed: () {
              Get.offAllNamed(AppRoutes.mainScreen);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
          child: Column(
            children: [
              ContainerMi(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(0),
                color: AppColorManger.backdark,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: AppSizes.h02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              AppStrings.golden,
                              style: context.textTheme.bodySmall!
                                  .copyWith(color: AppColorManger.primary),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              postsController.formatter.format(alert.start),
                              style: context.textTheme.displaySmall!
                                  .copyWith(color: AppColorManger.primary),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: AppSizes.w01,
                        ),
                        CircleAvatar(
                          radius: AppSizes.h04,
                          child: MyImage(
                            url: '${Api.viewPostsImages}/${alert.image}',
                            width: AppSizes.w13,
                            height: AppSizes.h1,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      alert.title,
                      style: context.textTheme.bodySmall!
                          .copyWith(color: AppColorManger.primary),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      alert.content,
                      style: context.textTheme.displayMedium!
                          .copyWith(color: AppColorManger.backlight),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
