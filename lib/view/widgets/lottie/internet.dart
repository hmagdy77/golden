import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyLottieInternet extends StatelessWidget {
  const MyLottieInternet({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/lottie/internet.json',
        // width: AppSizes.w1,
        // height: AppSizes.h1,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
