import '../../../libraries.dart';

class DotOnBoarding extends StatelessWidget {
  const DotOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingImp>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                margin: const EdgeInsets.all(5),
                height: 6,
                width: controller.currentPage == index ? 20 : 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColorManger.primary,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
