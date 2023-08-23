import 'package:get/get_navigation/src/routes/get_route.dart';

import 'core/middle_ware/middle_ware.dart';
import 'view/screens/activties/activties_screen.dart';
import 'view/screens/activties/activtiy_details_screen.dart';
import 'view/screens/activties/activtiy_sign_screen.dart';
import 'view/screens/alerts/alerts_screen.dart';
import 'view/screens/contact/contact_screen.dart';
import 'view/screens/contact/suggestions_screen.dart';
import 'view/screens/gallery/gallery_screen.dart';
import 'view/screens/main/home_screen.dart';

import 'view/screens/main_screen.dart';
import 'view/screens/news/news_details.dart';
import 'view/screens/news/news_screen.dart';
import 'view/screens/offers/offers_details.dart';
import 'view/screens/offers/offers_screen.dart';
import 'view/screens/on_boarding_screen.dart';
import 'view/screens/splash_screen.dart';
import 'view/screens/videos/videos_screen.dart';
import 'view/screens/web_view/web_view_screen.dart';

List<GetPage<dynamic>>? getRoutes = [
  GetPage(
    name: '/',
    page: () => OnBoardingScreen(),
    middlewares: [MiddleWare()],
  ),
  GetPage(
    name: AppRoutes.splashScreen,
    page: () => const SplashScreen(),
  ),

//************************main Screens************************
  //main Screens
  GetPage(name: AppRoutes.mainScreen, page: () => MainScreen()
      // ShowCaseWidget(
      //     builder: Builder(builder: (context) => const))
      ),
  GetPage(
    name: AppRoutes.homeScreen,
    page: () => HomeScreen(),
  ),
  //Activties
  GetPage(
    name: AppRoutes.activtiyDetailsScreen,
    page: () => ActivtiyDetailsScreen(),
  ),
// OfferDetails
  GetPage(
    name: AppRoutes.offerDetailsScreen,
    page: () => OfferDetailsScreen(),
  ),
  GetPage(
    name: AppRoutes.offerScreen,
    page: () => OfferScreen(),
  ),
// News
  GetPage(
    name: AppRoutes.newsDetailsScreen,
    page: () => NewsDetailsScreen(),
  ),
  GetPage(
    name: AppRoutes.newsScreen,
    page: () => NewsScreen(),
  ),
  // GalleryScreen
  GetPage(
    name: AppRoutes.galleryScreen,
    page: () => GalleryScreen(),
  ),
  // GalleryScreen
  GetPage(
    name: AppRoutes.activtiesScreen,
    page: () => ActivtiesScreen(),
  ),
  // GalleryScreen
  GetPage(
    name: AppRoutes.videosScreen,
    page: () => VideosScreen(),
  ),
  // ContactScreen
  GetPage(
    name: AppRoutes.contactScreen,
    page: () => const ContactScreen(),
  ),
  // ContactScreen
  GetPage(
    name: AppRoutes.suggestionsScreen,
    page: () => SuggestionsScreen(),
  ),
  // ActivtiySignScreen
  GetPage(
    name: AppRoutes.activtiySignScreen,
    page: () => ActivtiySignScreen(),
  ),
  GetPage(
    name: AppRoutes.webView,
    page: () => WebViewScreen(),
  ),
  GetPage(
    name: AppRoutes.alertsScreen,
    page: () => AlertsScreen(),
  ),
];

class AppRoutes {
  static const String onBoardingScreen = '/onBoarding';
  static const String splashScreen = '/splashScreen';
  //************************main Screens************************
  static const String mainScreen = '/mainScreen';
  static const String homeScreen = '/homeScreen';
  static const String activtiyDetailsScreen = '/activtiyDetailsScreen';
  static const String offerDetailsScreen = '/offerDetailsScreen';
  static const String offerScreen = '/offerScreen';
  static const String newsDetailsScreen = '/newsDetailsScreen';
  static const String newsScreen = '/newsScreen';
  static const String galleryScreen = '/galleryScreen';
  static const String activtiesScreen = '/activtiesScreen';
  static const String activtiySignScreen = '/activtiySignScreen';
  static const String videosScreen = '/videosScreen';
  static const String contactScreen = '/contactScreen';
  static const String suggestionsScreen = '/suggestionsScreen';
  static const String webView = '/agentArea';
  static const String alertsScreen = '/alertsScreen';
}
