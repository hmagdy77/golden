import '../../../libraries.dart';

class OnBoardingScreen extends GetView<OnBoardingImp> {
  OnBoardingScreen({Key? key}) : super(key: key);
  final OnBoardingImp onBoardingImp = Get.put(OnBoardingImp());
  final ImagesControllerImp imagesController = Get.put(ImagesControllerImp());
  final PostsControllerImp postsController = Get.put(PostsControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Expanded(
                    child: SliderOnBoarding(),
                  ),
                  SizedBox(
                    height: AppSizes.h02,
                  ),
                  const DotOnBoarding(),
                  SizedBox(
                    height: AppSizes.h02,
                  ),
                  MyButton(
                    minWidth: true,
                    text: AppStrings.continueWord,
                    onPressed: () {
                      controller.next();
                    },
                  ),
                  SizedBox(
                    height: AppSizes.h05,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
