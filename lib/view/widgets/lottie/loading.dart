import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyLottieLoading extends StatelessWidget {
  const MyLottieLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/lottie/loading.json',
        // width: AppSizes.w1,
        // height: AppSizes.h1,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
