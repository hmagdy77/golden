import '../../libraries.dart';

class MiddleWare extends GetMiddleware {
  MyService myService = Get.find();

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (myService.sharedPreferences.getBool(AppStrings.keyNotFirst) == true) {
      return const RouteSettings(name: AppRoutes.mainScreen);
    }
  }
}
