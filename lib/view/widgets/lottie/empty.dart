import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyLottieEmpty extends StatelessWidget {
  const MyLottieEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/lottie/empty.json',
        // width: AppSizes.w1,
        // height: AppSizes.h1,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
