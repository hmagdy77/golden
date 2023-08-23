import '../../../libraries.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});
  final PostsControllerImp postsController = Get.put(PostsControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.goldenNews),
      ),
      body: Container(
          color: context.theme.scaffoldBackgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Obx(() {
            if (postsController.isLoading.value) {
              return const MyLottieLoading();
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
                child: ListView.builder(
                  itemCount: postsController.news.isEmpty
                      ? 1
                      : postsController.news.length,
                  itemBuilder: (context, index) {
                    if (postsController.news.isEmpty) {
                      return Column(
                        children: [
                          SizedBox(
                            height: AppSizes.h2,
                          ),
                          const MyLottieInternet(),
                        ],
                      );
                    } else {
                      var news = postsController.news[index];
                      return PostItem(
                        post: news,
                      );
                    }
                  },
                ),
              );
            }
          })),
    );
  }
}
