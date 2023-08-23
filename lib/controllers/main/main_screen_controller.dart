  
  import '../../libraries.dart';

abstract class MainController extends GetxController {
  onPageChange(int value);
}

class MainControllerImp extends MainController {
  MyService myService = Get.find();
  late PageController pageController;
  var currentIndex = 0.obs;
  final GlobalKey<ScaffoldState> globalKeyActMainScreen =
      GlobalKey<ScaffoldState>();

  final globalKeyDrawer = GlobalKey();
  final globalKeyNotifications = GlobalKey();
  final globalKeyBottomNavigation = GlobalKey();
  final globalKeyOffers = GlobalKey();
  final globalKeyAgentArea = GlobalKey();
  final globalKeyContactUs = GlobalKey();

  final List titles = [
    AppStrings.golden,
    AppStrings.goldenOffers,
    AppStrings.goldenNews,
    AppStrings.golden,
  ].obs;

  final List screens = [
    HomeScreen(),
    OffersContainer(),
    const WebView(url: Api.agentAreaUrl),
    const AboutAcademyScreen(),
  ].obs;

  final List<GButton> tabs = [
    GButton(
      icon: Icons.home,
      text: AppStrings.home,
      iconColor: AppColorManger.primary,
      iconActiveColor: AppColorManger.primary,
      textStyle:
          Get.textTheme.displaySmall!.copyWith(color: AppColorManger.primary),
    ),
    GButton(
      icon: Icons.percent,
      text: AppStrings.offers,
      iconColor: AppColorManger.primary,
      iconActiveColor: AppColorManger.primary,
      textStyle:
          Get.textTheme.displaySmall!.copyWith(color: AppColorManger.primary),
      // leading: Stack(
      //   children: [
      //     IconButton(
      //       onPressed: () {
      //         },
      //       icon: Icon(
      //         Icons.percent,
      //         color: AppColorManger.primary,
      //       ),
      //     ),
      //     Positioned(
      //       top: 0,
      //       right: 0,
      //       child: CircleAvatar(
      //         backgroundColor: Colors.red,
      //         radius: 6,
      //       ),
      //     ),
      //   ],
      // ),
    ),
    GButton(
      icon: Icons.support_agent,
      text: AppStrings.agentArea,
      iconColor: AppColorManger.primary,
      iconActiveColor: AppColorManger.primary,
      textStyle:
          Get.textTheme.displaySmall!.copyWith(color: AppColorManger.primary),
    ),
    GButton(
      icon: Icons.person,
      text: AppStrings.academy,
      iconColor: AppColorManger.primary,
      iconActiveColor: AppColorManger.primary,
      textStyle:
          Get.textTheme.displaySmall!.copyWith(color: AppColorManger.primary),
    ),
  ];

  @override
  onPageChange(int value) {
    currentIndex.value = value;
    pageController.jumpToPage(value);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }
}
