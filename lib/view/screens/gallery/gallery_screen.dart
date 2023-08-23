import '../../../libraries.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({super.key});
  final ImagesControllerImp imagesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.gallery),
      ),
      body: Obx(
        () {
          if (imagesController.isLoading.value) {
            return const MyLottieLoading();
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                imagesController.allImages.clear();
                imagesController.sliderImages.clear();
                imagesController.galleryImages.clear();
                imagesController.getImages();
              },
              color: AppColorManger.primary,
              child: ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (imagesController.galleryImages.isEmpty) {
                    return Column(
                      children: [
                        SizedBox(
                          height: AppSizes.h2,
                        ),
                        const MyLottieInternet(),
                      ],
                    );
                  } else {
                    return Gallery(
                      imagesPostList: imagesController.galleryImages,
                    );
                  }
                },
              ),
            );
          }
        },
      ),
    );
  }
}
