import '../../../libraries.dart';

class ActivtiesScreen extends StatelessWidget {
  ActivtiesScreen({super.key});
  final PostsControllerImp postsController = Get.find<PostsControllerImp>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.activties),
        ),
        body: Obx(() {
          if (postsController.isLoading.value) {
            return const MyLottieLoading();
          } else if (postsController.activties.isEmpty) {
            return const MyLottieInternet();
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                postsController.postsList.clear();
                postsController.offers.clear();
                postsController.news.clear();
                postsController.activties.clear();
                postsController.alerts.clear();
                postsController.getPosts();
              },
              color: AppColorManger.primary,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: AppSizes.h25,
                ),
                itemBuilder: (context, index) {
                  var post = postsController.activties[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: PostItem(post: post),
                  );
                },
                itemCount: postsController.activties.length,
              ),
            );
          }
        }));
  }
}
