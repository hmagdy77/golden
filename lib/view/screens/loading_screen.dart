import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/lottie/done.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({super.key});
  final String screen = Get.arguments[0];

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 1), _goNext);
  }

  _goNext() {
    Get.offAllNamed(widget.screen);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: MyLottieDone(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}
