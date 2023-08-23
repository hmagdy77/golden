import 'package:get/get_navigation/src/routes/get_route.dart';

import 'view/screens/posts/show/alerts_screen.dart';
import 'view/screens/images/add_image_screen.dart';
import 'view/screens/posts/add_posts_screen.dart';
import 'view/screens/posts/show/act_screen.dart';
import 'view/screens/posts/show/news_screen.dart';
import 'view/screens/videos/add_video_screen.dart';
import 'view/screens/loading_screen.dart';
import 'view/screens/main_screen.dart';
import 'view/screens/posts/edit_post_screen.dart';
import 'view/screens/posts/show/offers_screen.dart';
import 'view/screens/signs/signs_screen.dart';
import 'view/screens/splash_screen.dart';

List<GetPage<dynamic>>? getRoutes = [
  GetPage(name: '/', page: () => const SplashScreen()),
  // GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreen()),

//************************main Screens************************
  //main Screens
  GetPage(
    name: AppRoutes.mainScreen,
    page: () => MainScreen(),
  ),
  GetPage(
    name: AppRoutes.loadingScreen,
    page: () => LoadingScreen(),
  ),

  // addImageScreen
  GetPage(
    name: AppRoutes.addImageScreen,
    page: () => AddImageScreen(),
  ),
  // addVideoScreen
  GetPage(
    name: AppRoutes.addVideoScreen,
    page: () => AddVideoScreen(),
  ),
  // AddPostScreen
  GetPage(
    name: AppRoutes.addPostScreen,
    page: () => const AddPostsScreen(),
  ),
//  editPostScreen
  GetPage(
    name: AppRoutes.editPostScreen,
    page: () => EditPostScreen(),
  ),
  // offersScreen
  GetPage(
    name: AppRoutes.offersScreen,
    page: () => OffersScreen(),
  ),
// News
  GetPage(
    name: AppRoutes.newsScreen,
    page: () => NewsScreen(),
  ),
  // activtiesScreen
  GetPage(
    name: AppRoutes.actScreen,
    page: () => ActScreen(),
  ),

  // requestsScreen
  GetPage(
    name: AppRoutes.signstsScreen,
    page: () => SignstsScreen(),
  ),
  // AlertsScreen
  GetPage(
    name: AppRoutes.alertsScreen,
    page: () => AlertsScreen(),
  ),
];

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  //************************main Screens************************
  static const String mainScreen = '/mainScreen';
  static const String loadingScreen = '/loadingScreen';
  static const String addPostScreen = '/addPostScreen';
  static const String addImageScreen = '/addImageScreen';
  static const String addVideoScreen = '/addVideoScreen';
  static const String editPostScreen = '/editPostScreen';
  static const String offersScreen = '/offersScreen';
  static const String newsScreen = '/newsScreen';
  static const String actScreen = '/actScreen';
  static const String signstsScreen = '/signstsScreen';
  static const String alertsScreen = '/alertsScreen';
}
