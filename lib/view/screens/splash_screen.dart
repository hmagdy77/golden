import '../../../libraries.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  // final int deuratin = Get.arguments[0];
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 1), _goNext);
  }

  _goNext() {
    // MyService myService = Get.find();
    // if (myService.sharedPreferences.getString(AppStrings.keyUserId) == null) {
    //   Get.offNamed(AppRoutes.loginScreen);
    // } else {
    //   Get.offNamed(AppRoutes.mainScreen);
    // }
    //
    Get.toNamed(AppRoutes.mainScreen);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColorManger.primary,
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: Image(
            image: AssetImage(AppImageAssets.logo),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}
