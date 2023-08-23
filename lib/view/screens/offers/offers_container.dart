import '../../../libraries.dart';

class OffersContainer extends StatelessWidget {
  OffersContainer({super.key});
  final PostsControllerImp postsController = Get.find<PostsControllerImp>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (postsController.isLoading.value) {
          return const MyLottieLoading();
        } else {
          return Container(
            color: context.theme.scaffoldBackgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: postsController.offers.isEmpty
                        ? 1
                        : postsController.offers.length,
                    itemBuilder: (context, index) {
                      if (postsController.offers.isEmpty) {
                        return Column(
                          children: [
                            SizedBox(
                              height: AppSizes.h2,
                            ),
                            const MyLottieInternet(),
                          ],
                        );
                      } else {
                        var offer = postsController.offers[index];
                        return PostItem(
                          post: offer,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
