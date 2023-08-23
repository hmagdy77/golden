import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
import '../../../controllers/on_boarding/on_boarding_controller.dart';
import '../../../data/static/static.dart';

class SliderOnBoarding extends GetView<OnBoardingImp> {
  const SliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const Spacer(),
            Text(
              onBoardingList[index].title!,
              style: context.textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Image.asset(onBoardingList[index].image!),
            const Spacer(),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(onBoardingList[index].body!,
                  textAlign: TextAlign.center,
                  style: context.textTheme.displayMedium),
            )
          ],
        );
      },
      onPageChanged: (index) {
        controller.onPageChange(index);
      },
    );
  }
}
