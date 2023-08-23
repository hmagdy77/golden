import '../../../libraries.dart';

class MyImagesSlider extends StatelessWidget {
  MyImagesSlider({super.key});
  final ImagesControllerImp imagesController = Get.find<ImagesControllerImp>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // images slider
        Expanded(
          // height: AppSizes.h24,
          child: CarouselSlider.builder(
            itemCount: imagesController.sliderImages.length,
            carouselController: imagesController.carouselController,
            itemBuilder: (context, index, realIndex) {
              return MyContainer(
                content: MyImageContainer(
                    url:
                        '${Api.viewOneImage}/${imagesController.sliderImages[index].name}'),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              height: AppSizes.h2,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlayInterval: const Duration(milliseconds: 3000),
              viewportFraction: .95,
              onPageChanged: (index, reason) {
                imagesController.currentImage.value = index;
              },
              animateToClosest: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 2000),
            ),
          ),
        ),
        //AnimatedSmoothIndicator
        Obx(
          () {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  imagesController.sliderImages.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    margin: const EdgeInsets.all(5),
                    height: AppSizes.h01 / 2,
                    width: imagesController.currentImage.value == index
                        ? AppSizes.w02
                        : AppSizes.w01,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: imagesController.currentImage.value == index
                          ? AppColorManger.primary
                          : AppColorManger.grey,
                    ),
                  ),
                )
              ],
            );
            // AnimatedSmoothIndicator(
            //   curve: Curves.easeInCubic,
            //   activeIndex: imagesController.currentImage.value,
            //   count: imagesController.sliderImages.length,

            //   effect: JumpingDotEffect(
            //     dotHeight: AppSizes.h01,
            //     dotWidth: AppSizes.w01,
            //     jumpScale: 0,
            //     dotColor: AppColorManger.grey,
            //     activeDotColor: AppColorManger.primary,

            //   ),
            // );
          },
        )
      ],
    );
  }
}
