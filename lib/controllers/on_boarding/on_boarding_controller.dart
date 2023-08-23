 

  import '../../libraries.dart';

abstract class OnBoardingController extends GetxController {
  next();

  onPageChange(int value);
}

class OnBoardingImp extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;
  MyService myService = Get.find();

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myService.sharedPreferences.setBool(AppStrings.keyNotFirst, true);
      Get.offAllNamed(AppRoutes.mainScreen);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  goNext() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      currentPage = -1;
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  goBack() {
    currentPage--;
    if (currentPage == -1) {
      currentPage = onBoardingList.length;
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChange(int value) {
    currentPage = value;
    update();
  }
}
