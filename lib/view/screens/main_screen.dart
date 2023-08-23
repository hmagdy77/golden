import 'package:upgrader/upgrader.dart';

import '../../../libraries.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final MainControllerImp mainController = Get.put(MainControllerImp());

  final ImagesControllerImp imagesController = Get.find<ImagesControllerImp>();

  final PostsControllerImp postsController = Get.find<PostsControllerImp>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return WillPopScope(
          onWillPop: () => exitAllert(context),
          child: UpgradeAlert(
            child: Scaffold(
              key: mainController.globalKeyActMainScreen,
              endDrawer: Drawer(
                child: Column(
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: AppColorManger.primary,
                      ),
                      child: MyLogo(),
                    ),
                    Expanded(child: DrawerColumn()),
                  ],
                ),
              ),
              appBar: AppBar(
                leading: NotificationIcon(),
                title: const Text(
                  AppStrings.golden,
                ),
              ),
              body: Obx(
                () {
                  if (imagesController.isLoading.value ||
                      postsController.isLoading.value) {
                    return const MyLottieLoading();
                  } else {
                    return SafeArea(
                      child: Stack(
                        children: [
                          PageSliderScreen(mainController: mainController),
                        ],
                      ),
                    );
                  }
                },
              ),
              bottomNavigationBar: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black.withOpacity(.1),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: GNav(
                    tabBackgroundColor: ThemeController().getDataFromBox()
                        ? const Color.fromARGB(255, 56, 51, 51)
                        : const Color.fromARGB(255, 240, 206, 160),
                    color: Colors.black,
                    tabBorderRadius: AppSizes.h1,
                    backgroundColor: context.theme.primaryColorDark,
                    gap: 8,
                    activeColor: Get.theme.primaryColorLight,
                    hoverColor: AppColorManger.grey,
                    iconSize: 24,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    duration: const Duration(milliseconds: 100),
                    tabs: mainController.tabs,
                    selectedIndex: mainController.currentIndex.value,
                    onTabChange: (index) {
                      mainController.onPageChange(index);
                    },
                    // rippleColor: AppColorManger.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
