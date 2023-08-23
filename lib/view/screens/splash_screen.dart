import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/app_color_manger.dart';
import '../../core/constants/app_image_assets.dart';
import '../../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
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
