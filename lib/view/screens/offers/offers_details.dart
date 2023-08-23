import '../../../libraries.dart';

class OfferDetailsScreen extends StatelessWidget {
  OfferDetailsScreen({super.key});
  final Post post = Get.arguments[0];
  final ImagesControllerImp imagesController = Get.find();
  final AgentsControllerImp agentsController = Get.put(AgentsControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.goldenOffers),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.w02),
        child: ListView(
          children: [
            Center(
              child: Text(
                post.title,
                style: context.textTheme.bodyMedium,
              ),
            ),
            Text(
              post.header,
              style: context.textTheme.displayLarge,
            ),
            Text(
              post.content,
              style: context.textTheme.displayMedium,
            ),
            SizedBox(
              height: AppSizes.h01,
            ),
            imagesController.postImages.isEmpty
                ? MyImage(
                    url: '${Api.viewPostsImages}/${post.image}',
                    width: double.infinity,
                    height: AppSizes.h3,
                  )
                : imagesController.postImages.length == 1
                    ? MyImage(
                        url:
                            '${Api.viewOneImage}/${imagesController.postImages[0].name}',
                        width: double.infinity,
                        height: AppSizes.h3,
                      )
                    : Gallery(
                        imagesPostList: imagesController.postImages,
                      ),
            SizedBox(
              height: AppSizes.h02,
            ),
            post.end.difference(DateTime.now()).inDays < 0
                ? const SizedBox()
                : MyButton(
                    text: AppStrings.reveseNow,
                    minWidth: true,
                    onPressed: () {
                      agentsController.age.clear();
                      agentsController.name.clear();
                      agentsController.phone.clear();
                      Get.toNamed(
                        AppRoutes.activtiySignScreen,
                        arguments: [post],
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
